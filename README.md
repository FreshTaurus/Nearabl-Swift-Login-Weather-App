# Running a Swift Project with CocoaPods

This guide explains how to set up, install dependencies, and run a Swift project using CocoaPods.

---

## Prerequisites

- Xcode installed on your Mac.
- CocoaPods installed. If not, install it with:

  ```bash
  sudo gem install cocoapods
  ```


## Steps to Install Dependencies and Run the Project

1. Navigate to Your Project Directory
Open Terminal and move to your project directory where the Podfile is located 
  ```bash
  cd /path/to/your/project
  ```

2. Install CocoaPods Dependencies
Run the following command to install the dependencies specified in your Podfile:
```bash
pod install
```
This command downloads and integrates the necessary libraries. It also creates a Podfile.lock file to lock the versions of your dependencies.


3. Open the `.xcworkspace` File
After installing the pods, always open your project using the `.xcworkspace` file instead of the `.xcodeproj` file.

4. Build and Run the Project
1. In Xcode, select your target device or simulator.
2. Click the Run button to build and run your project.