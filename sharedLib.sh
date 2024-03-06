#!/bin/bash

# Path to your Android project's jniLibs directory

WORKPATH=$(pwd)
JNI_LIBS_PATH="./ffi_sample/android/app/src/main/jniLibs"


PKG_PATH="main.go"

mkdir -p "$JNI_LIBS_PATH"
mkdir -p "$JNI_LIBS_PATH/arm64-v8a"
mkdir -p "$JNI_LIBS_PATH/armeabi-v7a"
mkdir -p "$JNI_LIBS_PATH/x86"
mkdir -p "$JNI_LIBS_PATH/x86_64"

cd "./go_sample"

# ARM (armeabi-v7a)
GOOS=android GOARCH=arm GOARM=7 CC="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/armv7a-linux-androideabi21-clang" CGO_ENABLED=1 go build -o libgame.so -buildmode=c-shared $PKG_PATH
mv libgame.so "$WORKPATH/$JNI_LIBS_PATH/armeabi-v7a/"

# ARM64 (arm64-v8a)
GOOS=android GOARCH=arm64 CC="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/aarch64-linux-android21-clang" CGO_ENABLED=1 go build -o libgame.so -buildmode=c-shared $PKG_PATH
mv libgame.so "$WORKPATH/$JNI_LIBS_PATH/arm64-v8a/"

# x86
GOOS=android GOARCH=386 CC="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/i686-linux-android21-clang" CGO_ENABLED=1 go build -o libgame.so -buildmode=c-shared $PKG_PATH
mv libgame.so "$WORKPATH/$JNI_LIBS_PATH/x86/"

# x86_64
GOOS=android GOARCH=amd64 CC="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/x86_64-linux-android21-clang" CGO_ENABLED=1 go build -o libgame.so -buildmode=c-shared $PKG_PATH
mv libgame.so "$WORKPATH/$JNI_LIBS_PATH/x86_64/"

cd ..
echo "Build and move completed."
