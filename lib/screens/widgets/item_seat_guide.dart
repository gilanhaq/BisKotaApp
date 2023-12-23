import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';

class SeatGuideItem extends StatelessWidget {
  final String guide;

  const SeatGuideItem({
    super.key,
    required this.guide,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Center(
        child: Text(
          guide,
          style: greyText.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
