import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Setting Page',
        style: blackText.copyWith(
          fontSize: 24,
          fontWeight: bold,
        ),
      ),
    );
  }
}
