# apns-ios-push-tester
Simple Swift iOS application (XCode project) to get APNs push messages from backends for testing, debug and development purposes.

## Features:
 - Requesting Push notification access on device;
 - Logs APNs device token;
 - Logs messages on receive.

## How to use:
0. Open the porject in XCode.
1. Go to the project's `Signing & Capabilities`, choose your Team (or create one).
2. Click on the `+` and add `Push notifications` capabilities.
3. From the XCode start the app on the physical iOS device connected to the Mac (choose physical device instead of simulator).
4. The App will pop-up on your connected device.
5. Click on the `Request access` button in the App. Allow push notifications.
6. In the XCode console you will get the APNs token for the testing device, that can be used in the backend to send the message to it.
7. Send APNs message to the device by the device token and yout team P12 certificate (you have choose the team in step 1).
8. When the message received by the app you will see the XCode log message with the message information and payload and push notification in iOS as well.
