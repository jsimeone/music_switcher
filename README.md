# Music Swapper!

A fun little app that lets you share songs between the two most popular music streaming platforms: Apple Music and Spotify. Just copy a link to one song and click one button to convert it.

## [Video Demonstration](https://drive.google.com/file/d/15lQYKf70ZCj76XTTKIRnkEZ-n_tRwyLp/view?usp=sharing)

## Notes for Graders
 - All my code is located in `/lib`
 - Please don't judge the way I store things like private keys. I'm so aware that it's terrible and I would never do it in production.

## Installation Instructions (if you really want to do that)
 - This version, while theoretically compatible with Apple and Android, was only tested on iOS because that's all I have. For that reason you will need a computer running MacOS to build this project.
 - If you're running Apple Silicon, run `sudo softwareupdate --install-rosetta --agree-to-license` in Terminal.
 - Download Xcode from the Mac App Store. This will take a while.
 - You probably already have git installed, but go check.
 - Download VSCode and [install the Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) from the built-in extension store.
 - Press `Command + Shift + P` and type `flutter`.
 - Select "Flutter: New Project" and click "Download SDK" when the option appears (if you don't already have Flutter installed). This will also install Dart.
 - Choose the folder that contains this repository as your installation location.
 - Add the Flutter SDK to your path as instructed by the install tool's output.
 - Quit VSCode + Terminal and restart them both.
 - Run this command in your newly restarted Terminal: `sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'`.
 - Run this command and agree to the XCode license: `sudo xcodebuild -license`.
 - Download and open a new iOS simulator with `xcodebuild -downloadPlatform iOS` and `open -a Simulator`.
 - Run `flutter doctor` in this repository's directory to make sure everything is setup correctly. Sometimes an error here with a non-essential component will still allow the app to run so give it a try before troubleshooting.
 - Open `/lib/main.dart` in VSCode and click the debug button in the top right. The app should run and attach to your simulator after about a minute.
   - If this doesn't work, try checking the build target in the bottom right of VSCode (the blue strip). This should show the simulator you're running. Change it if not.
 - Yay hopefully it works!! 🎉
