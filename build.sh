#!/bin/bash
set -e
docker build --no-cache -t thmatuza/oms-client-build:latest build/
CONTAINER=$(docker create thmatuza/oms-client-build:latest)
mkdir -p out/arm64-v8a out/armeabi-v7a out/x86

docker cp $CONTAINER:/webrtc/revision.txt out/
docker cp $CONTAINER:/webrtc/src/out/dist/release/arm64-v8a/libjingle_peerconnection_so.so out/arm64-v8a/
docker cp $CONTAINER:/webrtc/src/out/dist/release/armeabi-v7a/libjingle_peerconnection_so.so out/armeabi-v7a/
docker cp $CONTAINER:/webrtc/src/out/dist/release/x86/libjingle_peerconnection_so.so out/x86/
docker cp $CONTAINER:/webrtc/src/out/dist/release/libwebrtc.jar out/
docker rm $CONTAINER
echo "Done. You can find the generated files in the out/ directory."