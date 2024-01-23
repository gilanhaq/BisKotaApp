import 'package:biskota/cubit/auth_cubit.dart';
import 'package:biskota/cubit/transaction_cubit.dart';
import 'package:biskota/models/model_transaction.dart';
import 'package:biskota/screens/pages/success_page.dart';
import 'package:biskota/screens/widgets/custom_button.dart';
import 'package:biskota/screens/widgets/item_booking_details.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckoutPage(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 330,
              height: 104,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/imgs/img_checkout.png',
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MLG  ',
                      style: blackText.copyWith(
                        fontSize: 24,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      'Malang',
                      style: greyText.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'BTU',
                      style: blackText.copyWith(
                        fontSize: 24,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      'Batu',
                      style: greyText.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NOTE: DESTINATION TILE
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        transaction.destination.imageUrl,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackText.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyText.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(right: 4),
                  child: SvgPicture.asset('assets/svgs/ic_star.svg'),
                ),
                Text(
                  transaction.destination.rating.toString(),
                  style: blackText.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),

            //NOTE: BOOKING DETAILS TEXT
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style: blackText.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),

            //NOTE: BOOKING DETAILS ITEM
            BookingDetailItems(
              title: 'Traveler',
              valueText: '${transaction.amountOfTraveler} Person',
              valueColor: dark,
            ),
            BookingDetailItems(
              title: 'Seat',
              valueText: transaction.selectedSeats,
              valueColor: dark,
            ),
            BookingDetailItems(
              title: 'Insurance',
              valueText: transaction.insurance ? 'YES' : 'NO',
              valueColor: transaction.insurance ? success : error,
            ),
            BookingDetailItems(
              title: 'Refunable',
              valueText: transaction.refundable ? 'YES' : 'NO',
              valueColor: transaction.refundable ? success : error,
            ),
            BookingDetailItems(
              title: 'VAT',
              valueText: '${(transaction.vat * 100).toStringAsFixed(0)} %',
              valueColor: dark,
            ),
            BookingDetailItems(
              title: 'Price',
              valueText: NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp ',
                decimalDigits: 0,
              ).format(transaction.price),
              valueColor: dark,
            ),
            BookingDetailItems(
              title: 'Grand Total',
              valueText: NumberFormat.currency(
                locale: 'id',
                symbol: 'Rp ',
                decimalDigits: 0,
              ).format(transaction.grandTotal),
              valueColor: dark,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NOTE: DESTINATION TILE
                  Text(
                    'Payment Details',
                    style: blackText.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(
                          top: 16,
                          right: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: const DecorationImage(
                            image: AssetImage('assets/imgs/bg_wallet.png'),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/ic_logo.svg',
                              height: 24,
                              width: 24,
                            ),
                            const Spacer(),
                            Text(
                              'Pay',
                              style: whiteText.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'Rp ',
                                decimalDigits: 0,
                              ).format(state.user.balance),
                              style: blackText.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Current Balance',
                              style: greyText.copyWith(
                                fontSize: 14,
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }

          return SizedBox();
        },
      );
    }

    Widget payButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: error,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            margin: const EdgeInsets.only(top: 30),
            title: 'Pay Now',
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 30,
        ),
        child: Text(
          'Terms and Conditions',
          style: greyText.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroud,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          header(),
          bookingDetails(),
          paymentDetails(),
          payButton(),
          tacButton(),
        ],
      ),
    );
  }
}
