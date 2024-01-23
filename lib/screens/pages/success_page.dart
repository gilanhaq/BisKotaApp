import 'package:biskota/cubit/page_cubit.dart';
import 'package:biskota/screens/widgets/custom_button.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroud,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: const EdgeInsets.only(bottom: 80),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/imgs/img_booked.png',
                  ),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: blackText.copyWith(
                fontSize: 32,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Are you ready to explore the new\ndestination of experiences?',
              style: greyText.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              margin: const EdgeInsets.only(top: 50),
              width: 220,
              title: 'Back to Home',
              onPressed: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/main',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
