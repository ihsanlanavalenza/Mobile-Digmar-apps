# 🚀 DIGMAR App - Flutter

Digital Marketing Prediction & Analytics Application built with Flutter.

## 📱 Tech Stack

- **Framework:** Flutter 3.38+
- **Language:** Dart 3.10+
- **UI Components:** Material Design 3
- **Charts:** fl_chart
- **Maps:** google_maps_flutter
- **State Management:** Provider
- **Navigation:** GoRouter
- **Networking:** Dio + HTTP
- **Fonts:** Google Fonts (Inter)

## 📦 Dependencies

### Core
- `flutter_sdk`
- `cupertino_icons`

### UI & Styling
- `google_fonts` - Beautiful typography
- `flutter_svg` - SVG support
- `cached_network_image` - Image caching
- `flutter_animate` - Smooth animations

### Features
- `fl_chart` - Beautiful charts and graphs
- `google_maps_flutter` - Map integration
- `go_router` - Advanced routing
- `provider` - State management

### Networking
- `http` - HTTP client
- `dio` - Advanced HTTP client with interceptors

### Utilities
- `intl` - Internationalization
- `shared_preferences` - Local storage

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point
├── theme/
│   └── app_theme.dart       # Theme configuration
├── screens/                 # All app screens
├── widgets/                 # Reusable widgets
│   └── prediction_chart.dart
├── models/                  # Data models
├── services/                # API & Business logic
└── utils/
    └── constants.dart       # App constants
```

## 🎨 Features

- ✅ Modern Material Design 3 UI
- ✅ Custom Theme with Google Fonts
- ✅ Beautiful Charts (fl_chart)
- ✅ Map Integration Ready
- ✅ Responsive Design
- ✅ Clean Architecture

## 🚦 Getting Started

### Prerequisites

- Flutter SDK 3.38+ installed
- Dart 3.10+ installed
- VS Code / Android Studio
- For Android: Android Studio & SDK
- For iOS: Xcode (Mac only)
- For Web: Chrome

### Installation

1. **Clone & Navigate:**
   ```bash
   cd /Users/macbook/Desktop/Digmar-apps/digmarapps
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run on Web (Easiest):**
   ```bash
   flutter run -d chrome
   ```

4. **Run on Android/iOS:**
   ```bash
   flutter devices           # List available devices
   flutter run -d <device>   # Run on specific device
   ```

### Quick Commands

```bash
# Check Flutter setup
flutter doctor

# Run on web
flutter run -d chrome

# Run on specific device
flutter run -d <device-id>

# Hot reload (press 'r' in terminal while app is running)
# Hot restart (press 'R' in terminal)

# Build for production
flutter build apk          # Android APK
flutter build ios          # iOS (Mac only)
flutter build web          # Web
```

## 📱 Running the App

### Web (Recommended for Development)
```bash
flutter run -d chrome
```

### Android Emulator
1. Open Android Studio
2. Create/Start AVD (Android Virtual Device)
3. Run:
   ```bash
   flutter run
   ```

### iOS Simulator (Mac only)
```bash
open -a Simulator
flutter run
```

## 🎯 Next Steps

### 1. Configure Google Maps API
To use maps, you need Google Maps API key:

1. Get API key from [Google Cloud Console](https://console.cloud.google.com/)
2. For Android: Add to `android/app/src/main/AndroidManifest.xml`
   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY_HERE"/>
   ```
3. For iOS: Add to `ios/Runner/AppDelegate.swift`
   ```swift
   GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
   ```

### 2. Build Your Screens
Create screens in `lib/screens/`:
- Dashboard
- Analytics
- Maps View
- Settings

### 3. Integrate API
Configure base URL in `lib/utils/constants.dart` and create services in `lib/services/`

## 🎨 Customization

### Colors
Edit colors in [lib/theme/app_theme.dart](lib/theme/app_theme.dart):
```dart
static const Color primaryColor = Color(0xFF2196F3);
static const Color secondaryColor = Color(0xFF4CAF50);
```

### Fonts
Change font family in [lib/theme/app_theme.dart](lib/theme/app_theme.dart):
```dart
textTheme: GoogleFonts.robotoTextTheme(  // Change 'roboto' to any Google Font
```

## 📊 Sample Chart Usage

```dart
import 'package:digmarapps/widgets/prediction_chart.dart';

PredictionChart(
  title: 'Sales Prediction',
  dataPoints: [2, 4, 6, 8, 10, 12, 15],
)
```

## 🔧 Troubleshooting

### Android SDK not found
Install Android Studio from [developer.android.com](https://developer.android.com/studio)

### Xcode issues (Mac only)
```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

### Package conflicts
```bash
flutter pub upgrade
flutter clean
flutter pub get
```

## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [fl_chart Examples](https://github.com/imaNNeo/fl_chart)
- [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)
- [Material Design 3](https://m3.material.io/)

## 👨‍💻 Development

Built with ❤️ using Flutter

---

**Happy Coding! 🚀**

# Mobile-Digmar-apps
