FROM thmatuza/oms-client-build-base:latest

# Update code
WORKDIR /webrtc/src
RUN git checkout master && git pull && gclient sync

# Log revision
RUN git log --pretty=fuller HEAD...HEAD^ > /webrtc/revision.txt

# Apply patches
RUN mkdir /webrtc/src/patches
COPY ["patches/*.patch", "patches/.gitdir", "patches/"]
RUN /bin/bash -c 'shopt -s nullglob && for p in patches/*.patch; do echo "Applying $p..."; git apply $p; done'

# Build
RUN python scripts/build_android.py