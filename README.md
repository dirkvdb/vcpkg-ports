# vcpkg-ports
[![linux ci](https://github.com/VITObelgium/vcpkg-ports/workflows/CI-linux/badge.svg)](https://github.com/VITObelgium/vcpkg-ports/actions?query=workflow%3ACI-linux)
[![osx ci](https://github.com/VITObelgium/vcpkg-ports/workflows/CI-osx/badge.svg)](https://github.com/VITObelgium/vcpkg-ports/actions?query=workflow%3ACI-osx)
[![windows ci](https://github.com/VITObelgium/vcpkg-ports/workflows/CI-windows/badge.svg)](https://github.com/VITObelgium/vcpkg-ports/actions?query=workflow%3ACI-windows)

Recipes for building third party software libraries for easy cmake integration.

This is a subset of the ports of https://github.com/microsoft/vcpkg focused mainly on geospatial analysis and scientific computing.

These ports are tweaked to create fully static binaries.

## Getting started
#### Installing the required packages
e.g. Debian based system
```apt-get install git curl unzip tar cmake build-essential```
#### Build the vcpkg binary
```cmake -P bootstrap.cmake```
#### Install packages
```./bin/vcpkg cmake install gdal[spatialite]```
