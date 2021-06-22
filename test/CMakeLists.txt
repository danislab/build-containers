cmake_minimum_required(VERSION 3.6)

project (hello_cpp)

ADD_EXECUTABLE(test_cpp src/test_cpp.cpp)

FIND_PACKAGE (Eigen3 3.3 REQUIRED)
ADD_EXECUTABLE(test_eigen src/test_eigen.cpp)
target_link_libraries (test_eigen Eigen3::Eigen)

# set(Boost_DEBUG 1)
FIND_PACKAGE( Boost 1.67.0 REQUIRED )
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )
ADD_EXECUTABLE(test_boost src/test_boost.cpp)
TARGET_LINK_LIBRARIES( test_boost LINK_PUBLIC ${Boost_LIBRARIES} )
