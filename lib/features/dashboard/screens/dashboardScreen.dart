import 'package:flutter/material.dart';
import 'package:snk_narco/features/dashboard/widgets/home_banner.dart';

import '../widgets/main_action_button.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text('ระบบแจ้งเบาะแสยาเสพติด'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView(
            children: [
              const HomeBanner(),
              const SizedBox(height: 16),
              MainActionButton(),
              // CategorySection(),
            ],
          ),
        ),
      ),
    );
  }
}
