import 'dart:async';

import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/get-started');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svgs/ic_logo.svg',
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'BISKOTA',
            style: whiteText.copyWith(
              fontSize: 32,
              fontWeight: medium,
              letterSpacing: 10,
            ),
          )
        ],
      )),
    );
  }
}
