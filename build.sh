#!/usr/bin/env bash

mkdir build

APP="bcron"

xgo -go 1.10.x --targets=darwin/amd64 --dest=build ./
xgo -go 1.10.x --targets=darwin/386 --dest=build ./

xgo -go 1.10.x --targets=linux/amd64 --dest=build ./
xgo -go 1.10.x --targets=linux/386 --dest=build ./

xgo -go 1.10.x --targets=windows/amd64 --dest=build ./
xgo -go 1.10.x --targets=windows/386 --dest=build ./

mv build/$APP-darwin-10.6-amd64 build/$APP-osx-x64
mv build/$APP-darwin-10.6-386 build/$APP-osx-x32
mv build/$APP-linux-amd64 build/$APP-linux-x64
mv build/$APP-linux-386 build/$APP-linux-x32
mv build/$APP-windows-4.0-amd64.exe build/$APP-windows-x64.exe
mv build/$APP-windows-4.0-386.exe build/$APP-windows-x32.exe
