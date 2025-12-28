import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackReportStatus extends ConsumerWidget {
  const TrackReportStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(reportProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ติดตามสถานการแจ้งเบาะแส')),
      body: Center(
        child: Text("data"),
        // child: state.isLoading
        //     ? const CircularProgressIndicator()
        //     : ElevatedButton(
        //   onPressed: () {
        //     // ref.read(reportProvider.notifier).submitReport();
        //   },
        //   child: const Text('ส่งข้อมูล'),
        // ),
      ),
    );
  }
}
