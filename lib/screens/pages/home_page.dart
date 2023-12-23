import 'package:biskota/screens/widgets/card_destination.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:biskota/screens/widgets/tile_destination.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Widget header() {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: 30,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,\nGilang K.',
                  style: blackText.copyWith(
                    fontSize: 24,
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Where to go today?',
                  style: greyText.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/imgs/img_profile.png',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget popularDestinations() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 17),
            DestinationCard(
              destination: 'Jatim Park 1',
              location: 'Batu, Malang',
              imageUrl: 'assets/imgs/img_destination1.png',
              rating: 5.0,
            ),
            SizedBox(width: 8),
            DestinationCard(
              destination: 'BNS',
              location: 'Batu, Malang',
              imageUrl: 'assets/imgs/img_destination2.png',
              rating: 4.3,
            ),
            SizedBox(width: 8),
            DestinationCard(
              destination: 'Alun-Alun Batu',
              location: 'Batu, Malang',
              imageUrl: 'assets/imgs/img_destination3.png',
              rating: 4.1,
            ),
          ],
        ),
      ),
    );
  }

  Widget newDestination() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: defaultMargin,
        right: defaultMargin,
        bottom: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Routes',
            style: blackText.copyWith(
              fontSize: 18,
              fontWeight: semibold,
            ),
          ),
          const DestinationTile(
            newDestination: 'Alun-Alun Tugu',
            newLocation: 'Malang',
            newImageUrl: 'assets/imgs/img_destination4.png',
            newRating: 4.7,
          ),
          const DestinationTile(
            newDestination: 'Ijen Bulevard',
            newLocation: 'Malang',
            newImageUrl: 'assets/imgs/img_destination5.png',
            newRating: 4.7,
          ),
          const DestinationTile(
            newDestination: 'Kayutangan',
            newLocation: 'Singapura',
            newImageUrl: 'assets/imgs/img_destination6.png',
            newRating: 4.7,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        popularDestinations(),
        newDestination(),
      ],
    );
  }
}
