import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackReportState extends ConsumerWidget {
  const TrackReportState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('แจ้งเบาะแส')),
      body: Center(child: Text("data")),
    );
  }
}
