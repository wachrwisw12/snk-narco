class AppRoutes {
  static const root = '/'; // root → redirect ไป splash
  static const loading = '/loading'; // splash screen

  // หน้า auth
  static const login = '/login';
  static const otp = '/otp';
  static const offlinePage = '/offline';

  // หน้า main
  static const dashboard = '/dashboard';
  static const trackReport = '/trackReport';
  static const notifications = '/notifications';
  static const leaveDetail = '/leave/:id';
  static const profile = '/profile';
  static const settings = '/settings';
}
