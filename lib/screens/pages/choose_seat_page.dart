import 'package:biskota/screens/pages/checkout_page.dart';
import 'package:biskota/screens/widgets/item_seat_guide.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:biskota/screens/widgets/custom_button.dart';
import 'package:biskota/screens/widgets/item_seat.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackText.copyWith(
            fontSize: 24,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            //NOTE: AVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(right: 6),
              child: SvgPicture.asset('assets/svgs/ic_available.svg'),
            ),
            Text(
              'Available',
              style: blackText,
            ),

            //NOTE: SELECTED
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(left: 10, right: 6),
              child: SvgPicture.asset('assets/svgs/ic_selected.svg'),
            ),
            Text(
              'Selected',
              style: blackText,
            ),

            //NOTE: UNAVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(left: 10, right: 6),
              child: SvgPicture.asset('assets/svgs/ic_unavailable.svg'),
            ),
            Text(
              'Unavailable',
              style: blackText,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        child: Column(
          children: [
            //NOTE: SEAT INDICATORS
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SeatGuideItem(guide: 'A'),
                SeatGuideItem(guide: 'B'),
                SeatGuideItem(guide: ''),
                SeatGuideItem(guide: 'C'),
                SeatGuideItem(guide: 'D'),
              ],
            ),

            //NOTE: SEAT 1
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 2),
                  SeatItem(status: 2),
                  SeatGuideItem(guide: '1'),
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                ],
              ),
            ),

            //NOTE: SEAT 2
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                  SeatGuideItem(guide: '2'),
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                ],
              ),
            ),

            //NOTE: SEAT 3
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 1),
                  SeatItem(status: 1),
                  SeatGuideItem(guide: '3'),
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                ],
              ),
            ),

            //NOTE: SEAT 4
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                  SeatGuideItem(guide: '4'),
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                ],
              ),
            ),

            //NOTE: SEAT 5
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                  SeatGuideItem(guide: '5'),
                  SeatItem(status: 2),
                  SeatItem(status: 0),
                ],
              ),
            ),

            //NOTE: YOUR SEAT
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Seat',
                    style: greyText.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'A3, B3',
                    style: blackText.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            //NOTE: PRICE
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: greyText.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'Rp 600.000',
                    style: primaryText.copyWith(
                      fontWeight: semibold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return CustomButton(
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 46,
        ),
        title: 'Continue to Checkout',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckoutPage(),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroud,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton(),
        ],
      ),
    );
  }
}
