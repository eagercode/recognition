FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install wget unzip python2.7-dev python3.5-dev build-essential cmake git pkg-config -y
RUN apt-get install libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev -y
RUN apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
RUN apt-get install libgtk2.0-dev -y
RUN apt-get install libatlas-base-dev gfortran -y

RUN wget https://bootstrap.pypa.io/get-pip.py

RUN ["/bin/bash", "-c", "python3.5 get-pip.py"]

RUN rm -rf /get-pip.py /.cache/pip

RUN ["/bin/bash", "-c", "pip install numpy"]

RUN wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip
RUN unzip opencv.zip

RUN wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip
RUN unzip opencv_contrib.zip

WORKDIR /opencv-3.1.0
RUN mkdir build
WORKDIR /opencv-3.1.0/build

RUN ["/bin/bash", "-c", "cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D INSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=OFF -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib-3.1.0/modules -D PYTHON_EXECUTABLE=/usr/bin/python3.5 -D BUILD_EXAMPLES=ON .."]

RUN ["/bin/bash", "-c", "make -j4"]
RUN ["/bin/bash", "-c", "make install"]
RUN ["/bin/bash", "-c", "ldconfig"]
