ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN sudo apt-get update
RUN sudo apt-get install gedit -y

RUN sudo apt-get install file -y
RUN sudo apt-get install xz-utils -y
RUN sudo apt-get install libgtk-3-dev -y
RUN sudo apt-get install clang -y
RUN sudo apt-get install cmake -y
RUN sudo apt-get install ninja-build -y
RUN sudo apt-get install pkg-config -y
RUN sudo apt-get install dpkg -y
RUN sudo apt-get install fonts-liberation -y
RUN sudo apt-get install libasound2 -y
RUN sudo apt-get install libnspr4 -y
RUN sudo apt-get install libnss3 -y
RUN sudo apt-get install xdg-utils -y
