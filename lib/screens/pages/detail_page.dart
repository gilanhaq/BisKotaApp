import 'package:biskota/models/model_destination.dart';
import 'package:biskota/screens/pages/choose_seat_page.dart';
import 'package:biskota/screens/widgets/custom_button.dart';
import 'package:biskota/screens/widgets/item_interest.dart';
import 'package:biskota/screens/widgets/item_photo.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DetailPage(this.destination, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              destination.imageUrl,
            ),
          ),
        ),
      );
    }

    Widget customGradient() {
      return Container(
        margin: const EdgeInsets.only(top: 236),
        width: double.infinity,
        height: 214,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            //NOTE: EMBLEM
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: 108,
              height: 24,
              child: SvgPicture.asset('assets/svgs/ic_emblem.svg'),
            ),

            //NOTE: TITLE
            Container(
              margin: const EdgeInsets.only(top: 248),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteText.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          destination.city,
                          style: whiteText.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset('assets/svgs/ic_star.svg'),
                      ),
                      Text(
                        destination.rating.toString(),
                        style: whiteText.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //NOTE: DESCRIPTION
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20),
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
                  //NOTE ABOUT
                  Text(
                    'About',
                    style: blackText.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Malang adalah sebuah kota yang terletak di provinsi Jawa Timur, Indonesia, Kota terbesar kedua di Jawa Timur setelah Surabaya, dan kota terbesar ke-12 di Indonesia.',
                    style: blackText.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      height: 2,
                    ),
                  ),

                  //NOTE PHOTOS
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Photos',
                    style: blackText.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Row(
                    children: [
                      PhotoItem(imageUrl: 'assets/imgs/img_photo1.png'),
                      PhotoItem(imageUrl: 'assets/imgs/img_photo2.png'),
                      PhotoItem(imageUrl: 'assets/imgs/img_photo3.png'),
                    ],
                  ),

                  //NOTE INTEREST
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Interest',
                    style: blackText.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Row(
                    children: [
                      InterestItem(title: 'Amusement Park'),
                      InterestItem(title: 'Body Museum'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      InterestItem(title: 'Roller Coaster'),
                      InterestItem(title: 'Happy Boat'),
                    ],
                  ),
                ],
              ),
            ),

            //NOTE PRICE & BOOK BUTTON
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  //NOTE PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                              .format(destination.price),
                          style: blackText.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'per orang',
                          style: greyText.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //NOTE: BOOK BUTTON
                  CustomButton(
                    title: 'Book Now',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseSeatPage(destination),
                        ),
                      );
                    },
                    width: 170,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroud,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customGradient(),
            content(),
          ],
        ),
      ),
    );
  }
}
