import 'package:biskota/models/model_transaction.dart';
import 'package:biskota/screens/widgets/item_booking_details.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
