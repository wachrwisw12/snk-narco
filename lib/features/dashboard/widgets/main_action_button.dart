import 'package:flutter/material.dart';

class MainActionButton extends StatelessWidget {
  const MainActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange.shade100,
          foregroundColor: Colors.orange.shade900,
          elevation: 0,
        ),
        icon: Icon(Icons.campaign),
        label: Text('แจ้งเบาะแส'),
        onPressed: () {},
      ),
    );
  }
}
