import 'package:biskota/cubit/auth_cubit.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(
                defaultMargin,
              ),
              width: 300,
              height: 211,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/imgs/bg_card.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: primary.withOpacity(.5),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteText.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              '${state.user.name}',
                              style: whiteText.copyWith(
                                fontWeight: medium,
                                fontSize: 20,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(right: 6),
                        child: SvgPicture.asset(
                          'assets/svgs/ic_logo.svg',
                        ),
                      ),
                      Text(
                        'Pay',
                        style: whiteText.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Text(
                    'Balance',
                    style: whiteText.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Rp ${state.user.balance}',
                    style: whiteText.copyWith(
                      fontWeight: bold,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
