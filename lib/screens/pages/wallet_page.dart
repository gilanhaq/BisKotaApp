import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Wallet Page',
        style: blackText.copyWith(
          fontSize: 24,
          fontWeight: bold,
        ),
      ),
    );
  }
}
