# MQTTBox-Fix
Solve lib dependecies error 

## _Solve starting error_
```
(MQTTBox:5514): Pango-ERROR **: 17:03:35.617: Harfbuzz version too old (1.2.7)

Trace/breakpoint trap (core dumped)
```
## Features

- [LIB] Fix libraries dependecies error (Ubuntu ver.)

## Installation

- Download libraries from Bionic repository [Ubuntu Software Packages root](https://packages.ubuntu.com/bionic/libs/):
  
  [libpango-1.0-0](https://packages.ubuntu.com/bionic/libs/libpango-1.0-0)
  [libpangocairo-1.0-0](https://packages.ubuntu.com/bionic/libs/libpangocairo-1.0-0)
  [libpangoft2-1.0-0](https://packages.ubuntu.com/bionic/libs/libpangoft2-1.0-0)

  Select architecture, ex. amd64
  [libpango-1.0-0](https://packages.ubuntu.com/bionic/amd64/libpango1.0-0/download)
  [libpangocairo-1.0-0](https://packages.ubuntu.com/bionic/amd64/libpangocairo-1.0-0/download)
  [libpangoft2-1.0-0](https://packages.ubuntu.com/bionic/amd64/libpangoft2-1.0-0/download)

- Open .deb with **Archive Manager**
- Open data.tar.xz file
- Extract two files from /./usr/lib/x86_64-linux-gnu/ in the root folder of MQTTBox

> Note: `This is tested on Ubuntu/Mint 20`
