import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {
  //NOTE: 0. Available 1. Selected 2. Unavailable
  final int status;

  const SeatItem({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      switch (status) {
        case 0:
          return const Color(0xffE0D9FF);
        case 1:
          return primary;
        case 2:
          return lightGrey;
        default:
          return lightGrey;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return primary;
        case 1:
          return primary;
        case 2:
          return lightGrey;
        default:
          return lightGrey;
      }
    }

    child() {
      switch (status) {
        case 0:
          return const SizedBox();
        case 1:
          return Center(
            child: Text(
              'YOU',
              style: whiteText.copyWith(fontSize: 16, fontWeight: semibold),
            ),
          );
        case 2:
          return const SizedBox();
        default:
          return const SizedBox();
      }
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor(),
          width: 2,
        ),
      ),
      child: child(),
    );
  }
}
