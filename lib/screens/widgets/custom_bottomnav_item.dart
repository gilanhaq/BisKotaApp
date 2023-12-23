import 'package:biskota/cubit/page_cubit.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavItem extends StatelessWidget {
  final int index;
  final String icon;

  const CustomBottomNavItem({
    Key? key,
    required this.index,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
            // ignore: deprecated_member_use
            color: context.read<PageCubit>().state == index ? primary : grey,
          ),
          AnimatedContainer(
            width: 30,
            height: 2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? primary
                  : transparent,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ],
      ),
    );
  }
}
