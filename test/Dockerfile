FROM danislab/3d-lithium:latest

COPY . /usr/src/test_cicd

WORKDIR /usr/src/test_cicd

RUN ./make_release.sh -b buildLinuxRelease
RUN ./make_release.sh -w -b buildWindowsRelease