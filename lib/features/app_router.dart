import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:snk_narco/features/dashboard/screens/dashboardScreen.dart';
import 'package:snk_narco/features/trackReport/screens/track_report_status.dart';
import '../config/constants.dart';
import '../core/widgets/splash_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: AppRoutes.loading, // เริ่มจาก Splash

    redirect: (context, state) {
      // สามารถเก็บสถานะ splash ผ่าน Riverpod หรือ simple variable
      // ตัวอย่างใช้ Future.delayed ภายใน SplashScreen แทน
      return null; // null = ไม่ redirect
    },

    routes: [
      GoRoute(
        path: AppRoutes.loading,
        builder: (_, __) => const SplashScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          final location = state.uri.path;
          return MainScaffold(location: location, child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.dashboard,
            builder: (context, state) => const Dashboard(),
          ),
          GoRoute(
            path: AppRoutes.notifications,
            builder: (context, state) =>
                const Dashboard(), // เปลี่ยนเป็น NotificationsScreen
          ),
          GoRoute(
            path: AppRoutes.trackReport,
            builder: (context, state) =>
                const TrackReportStatus(), // เปลี่ยนเป็น ProfileScreen
          ),
        ],
      ),
    ],
  );

  return router;
});

class MainScaffold extends StatelessWidget {
  final Widget child;
  final String location;

  const MainScaffold({super.key, required this.child, required this.location});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      AppRoutes.dashboard,
      AppRoutes.trackReport,
      AppRoutes.notifications,
    ];
    int currentIndex = tabs.indexWhere((path) => location.startsWith(path));

    return Scaffold(
      body: child,

      // ปุ่มตรงกลาง
      floatingActionButton: Transform.scale(
        scale: 1.0, // ขยาย 2 เท่า
        child: FloatingActionButton(
          backgroundColor: Colors.teal,
          shape: const CircleBorder(),
          onPressed: () {
            context.go(AppRoutes.trackReport);
          },
          child: const Icon(size: 32, Icons.lock_clock),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Bottom AppBar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        child: SizedBox(
          height: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabItem(
                context,
                icon: Icons.home,
                label: "หน้าแรก",
                index: 0,
                selectedIndex: currentIndex,
                route: AppRoutes.dashboard,
              ),
              _buildTabItem(
                context,
                icon: Icons.person,
                label: "ติดตามสถานะ",
                index: 1,
                selectedIndex: currentIndex,
                route: AppRoutes.trackReport,
              ),
              const SizedBox(width: 40), // เว้นที่ให้ FAB
              _buildTabItem(
                context,
                icon: Icons.notifications,
                label: "แจ้งเตือน",
                index: 2,
                selectedIndex: currentIndex,
                route: AppRoutes.notifications,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required int selectedIndex,
    required String route,
  }) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => context.go(route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.teal : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.teal : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
