import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InterestItem extends StatelessWidget {
  final String title;

  const InterestItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
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
        ],
      ),
    );
  }
}
