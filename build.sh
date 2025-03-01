#!/usr/bin/env bash
# exit on error
set -o errexit

# Install required dependencies
apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa chromium

# Download Flutter SDK
git clone https://github.com/flutter/flutter.git
export PATH="$PATH:`pwd`/flutter/bin"

# Use Chromium instead of Chrome
export CHROME_EXECUTABLE=$(which chromium)

# Install Flutter
flutter precache
flutter doctor
flutter pub get

# Build for web
flutter build web

# Copy the build files to the public directory
mkdir -p public
cp -r build/web/* public/ 