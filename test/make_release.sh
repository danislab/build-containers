#!/bin/bash


##### Messages,  warnings and errors #####
function PrintErrorMessage
{
    >&2 echo -en "\033[1;31mERROR: $1\033[0m\n"
}

function PrintWarningMessage
{
    >&2 echo -en "\033[1;31mWarning: $1\033[0m\n"
}

function PrintMessage
{
    echo -en "\033[1;32m$1\033[0m\n"
}


function PrintHelp
{
    PrintMessage "make_release.sh [flags] ROOT_DIRECTORY"
    PrintMessage "The script uses argument 1 as the root directory for the framework"
    PrintMessage "Command line options:"
    PrintMessage "-h\t\tShow this message and exit."
    PrintMessage "-w\t\tIf on linux, build a release for windows."
    PrintMessage "-b <builddir>\t\tSpecify the build dir. Default is \"build\""
    PrintMessage "-c\t\tOnly configure, do not start the build process."
    PrintMessage "-j <n>\t\tUse n threads for building. Default is 20."
}


function RunCMake
{
    WIN_HOST=$1
    WIN_TARGET=$2
    CMAKE_OPTIONS=""


    if [ $WIN_HOST -eq 0 ]
    then
        if [ $WIN_TARGET -eq 1 ] # crosscompile
        then
        CMAKE_OPTIONS="$CMAKE_OPTIONS -DCMAKE_TOOLCHAIN_FILE=toolchain/ToolchainWin64.cmake"
        fi
    fi

    cmake $CMAKE_OPTIONS ..
}


function IsWindowsSystem
{
    # check if we have a windows command
    type wmic >/dev/null 2>&1 ||
    {
        echo 0
        return
    }
    echo 1
}


function main
{
    WIN_TARGET=0
    ONLY_CONFIGURE=0
    BUILDDIR=build
    THREADS=20


    while getopts "hwb:cj:" opt; do
        case "$opt" in
        h)  PrintHelp
            exit 0
            ;;
        w)  WIN_TARGET=1
            ;;
        b)  BUILDDIR=$OPTARG
            ;;
        c)  ONLY_CONFIGURE=1
            ;;
        j)  THREADS=$OPTARG
            ;;
    esac
    done


    # creat builddir if not exists
    if [ ! -d $BUILDDIR ]
    then
        mkdir $BUILDDIR
    fi


    if [ $(IsWindowsSystem) -eq 1 ]
    then
        WIN_HOST=1
        WIN_TARGET=1
    else
        WIN_HOST=0
    fi


    cd $BUILDDIR
    echo -e $WIN_HOST
    echo -e $WIN_TARGET
    RunCMake $WIN_HOST $WIN_TARGET
    cd ..


    if [ $ONLY_CONFIGURE -eq 0 ]
    then
        if [ $WIN_HOST -eq 1 ]
        then
            cmake --build $BUILDDIR
        else
            cmake --build $BUILDDIR --target all -- -j ${THREADS}
        fi
    fi
}


echo -e "Build 3D-Lithium"
main $@


