#!/usr/bin/env bash
# exit on error
set -o errexit

# Download Flutter SDK
git clone https://github.com/flutter/flutter.git
export PATH="$PATH:`pwd`/flutter/bin"

# Install Flutter
flutter precache
flutter doctor
flutter pub get

# Build for web
flutter build web

# Copy the build files to the public directory
mkdir -p public
cp -r build/web/* public/ 