import 'package:biskota/screens/widgets/custom_button.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/imgs/bg_get_started.png',
                ),
                fit: BoxFit.fill),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Swift City Escapes',
                style: whiteText.copyWith(
                  fontSize: 32,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Discover the City with Us and Dive into Unforgettable Journeys!',
                style: whiteText.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                title: 'Get Started',
                width: 220,
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
                margin: const EdgeInsets.only(top: 50, bottom: 80),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
