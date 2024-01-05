import 'package:biskota/cubit/seat_cubit.dart';
import 'package:biskota/models/model_destination.dart';
import 'package:biskota/screens/pages/checkout_page.dart';
import 'package:biskota/screens/widgets/item_seat_guide.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:biskota/screens/widgets/custom_button.dart';
import 'package:biskota/screens/widgets/item_seat.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  ChooseSeatPage(this.destination, {super.key});

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
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
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
                      SeatItem(
                        id: 'A1',
                        isAvailable: false,
                      ),
                      SeatItem(
                        id: 'B1',
                        isAvailable: false,
                      ),
                      SeatGuideItem(guide: '1'),
                      SeatItem(
                        id: 'C1',
                      ),
                      SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),

                //NOTE: SEAT 2
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A2',
                        isAvailable: false,
                      ),
                      SeatItem(
                        id: 'B2',
                      ),
                      SeatGuideItem(guide: '2'),
                      SeatItem(
                        id: 'C2',
                        isAvailable: false,
                      ),
                      SeatItem(
                        id: 'D2',
                        isAvailable: false,
                      ),
                    ],
                  ),
                ),

                //NOTE: SEAT 3
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A3',
                      ),
                      SeatItem(
                        id: 'B3',
                        isAvailable: false,
                      ),
                      SeatGuideItem(guide: '3'),
                      SeatItem(
                        id: 'C3',
                      ),
                      SeatItem(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),

                //NOTE: SEAT 4
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A4',
                      ),
                      SeatItem(
                        id: 'B4',
                      ),
                      SeatGuideItem(guide: '4'),
                      SeatItem(
                        id: 'C4',
                        isAvailable: false,
                      ),
                      SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),

                //NOTE: SEAT 5
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A5',
                      ),
                      SeatItem(
                        id: 'B5',
                      ),
                      SeatGuideItem(guide: '5'),
                      SeatItem(
                        id: 'C5',
                      ),
                      SeatItem(
                        id: 'D5',
                        isAvailable: false,
                      ),
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
                        state.join(', '),
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
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp ',
                          decimalDigits: 0,
                        ).format(state.length * destination.price),
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
        },
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
