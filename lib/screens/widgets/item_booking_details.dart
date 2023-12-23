import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingDetailItems extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const BookingDetailItems({
    super.key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 6),
            child: SvgPicture.asset(
              'assets/svgs/ic_checklist.svg',
              // ignore: deprecated_member_use
              color: primary,
            ),
          ),
          Text(
            title,
            style: blackText,
          ),
          const Spacer(),
          Text(
            valueText,
            style: blackText.copyWith(
              fontWeight: semibold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
