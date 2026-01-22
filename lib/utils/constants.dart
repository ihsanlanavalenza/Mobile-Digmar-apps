class AppConstants {
  // API Base URL
  static const String baseUrl = 'https://api.digmar.com';

  // API Endpoints
  static const String authEndpoint = '/auth';
  static const String dataEndpoint = '/data';
  static const String predictionsEndpoint = '/predictions';

  // App Info
  static const String appName = 'DIGMAR';
  static const String appVersion = '1.0.0';

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;

  // Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;

  // Animation Duration
  static const Duration shortDuration = Duration(milliseconds: 200);
  static const Duration mediumDuration = Duration(milliseconds: 300);
  static const Duration longDuration = Duration(milliseconds: 500);
}
