# Town Squar

#Initial Features

• Display list of today activities
• Filter by category
• User can join the activities

To build and run this project, ensure you have the following installed:

1. Development Environment
   • Flutter SDK (Version 3.x or later recommended)
   • Android Studio or Visual Studio Code
   • Dart >=3.5.4 or later
2. Platform-Specific Dependencies
   • Android: Android API level 23+ with Gradle
   • Web: Chrome, Edge, or Safari browsers

3. Libraries and Plugins Used
   • Getx for state management
   • Firebase and database
   • Intl
   • cached_network_image
   • firebase_crashlytics
   • firebase_core
   • logger
   • url_strategy
   • google_fonts
   • dotted_border
   • flutter_svg

4. Font used:
   Download the font requirement:

   • SF Pro Display

#Installation

Follow these steps to get started:

1. Clone the Repository

• git clone https://github.com/yourusername/booking-reservation-app.git
• cd booking-reservation-app

2. Install Dependencies
   Run the following command to install all necessary packages:

• flutter pub get

3. Configure Firebase
   Add your google-services.json (for Android) or GoogleService-Info.plist (for iOS) files in their respective directories:

• android/app/ for Android
• ios/Runner/ for iOS

4. Run the App
   Run on an Android or iOS simulator, or connect your physical device:

• flutter run

5. Build for Production (Optional)
   To create production builds for different platforms:

Android:
• flutter build apk

iOS:
• flutter build ios

Web:
• flutter build web

#How the App Works

Step 1: Show all activities today
Step 2: Users can select and join the activities for once.
Step 3: User can filter by category
