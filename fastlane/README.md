fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios testflightdev
```
fastlane ios testflightdev
```
Upload a new development build to TestFlight
### ios testflightprod
```
fastlane ios testflightprod
```
Upload a new production build to TestFlight
### ios firebasedev
```
fastlane ios firebasedev
```
Upload a new development build to Firebase App Distribution
### ios firebaseprod
```
fastlane ios firebaseprod
```
Upload a new production build to Firebase App Distribution

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
