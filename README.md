# OMS Native SDK Build Script

This is a Dockerfile to build the [OMS Native SDK](https://github.com/open-media-streamer/oms-client-native) for Android
using the new GN based build system.

This is based on [WebRTC PeerConnection Build Script
](https://github.com/threema-ch/webrtc-build-docker).

## Usage

First, build the base image:

    ./build-base.sh

This will download lots and lots of data from the Chromium project. On my test
system, it took about 1-1.5 hours with a resulting image being 28 GiB.

Then, start the actual build process based on the previously downloaded data:

    ./build.sh

This will take probably around 0.5-1 hour. Once the script finished, you'll get
the following output in the `out/` directory:

 - `libwebrtc.jar`
 - `arm64-v8a/libjingle_peerconnection_so.so`
 - `armeabi-v7a/libjingle_peerconnection_so.so`
 - `x86/libjingle_peerconnection_so.so`

If you want a non-release build, or if you want to build for other platforms,
feel free to adjust the Dockerfiles.

## Troubleshooting

### Docker: «No space left on device»

If you use Docker with the `devicemapper` storage driver, it's possible that
you get "no space left on device" errors even though there's still disk space
left. This has to do with the way the storage is managed by Docker.

To check the used storage driver, use the `docker info` command.

To solve this issue, either [increase the devicemapper pool
size](https://jpetazzo.github.io/2014/01/29/docker-device-mapper-resize/) or
switch to a file system based storage driver like `overlay2`.

## License

    The MIT License (MIT)
    Copyright (c) 2019 Tomohiro Matsuzawa

    Permission is hereby granted, free of charge, to any person
    obtaining a copy of this software and associated documentation files
    (the "Software"), to deal in the Software without restriction,
    including without limitation the rights to use, copy, modify, merge,
    publish, distribute, sublicense, and/or sell copies of the Software,
    and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
    BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
    ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.