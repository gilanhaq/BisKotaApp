import 'package:biskota/cubit/seat_cubit.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final bool isAvailable;
  final String id;

  const SeatItem({
    super.key,
    this.isAvailable = true,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return lightGrey;
      } else {
        if (isSelected) {
          return primary;
        } else {
          return const Color(0xffE0D9FF);
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return lightGrey;
      } else {
        return primary;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
        );
      } else {
        const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
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
      ),
    );
  }
}
