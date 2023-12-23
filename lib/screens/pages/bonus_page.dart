import 'package:biskota/screens/widgets/custom_button.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return Container(
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
                        'Gilang K.',
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
              'Rp 280.000.000',
              style: whiteText.copyWith(
                fontWeight: bold,
                fontSize: 26,
              ),
            ),
          ],
        ),
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 80),
        child: Text(
          'Big Bonus 🎉',
          style: blackText.copyWith(
            fontSize: 32,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget subtitle() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          'We give you early credit so that\nyou can buy a flight ticket',
          style: greyText.copyWith(
            fontSize: 16,
            fontWeight: light,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget startButton() {
      return CustomButton(
        title: 'Start Book Now',
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        },
        margin: const EdgeInsets.only(top: 50),
        width: 220,
      );
    }

    return Scaffold(
      backgroundColor: backgroud,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subtitle(),
            startButton(),
          ],
        ),
      ),
    );
  }
}
