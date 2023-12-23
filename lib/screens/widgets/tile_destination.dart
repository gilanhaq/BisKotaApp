import 'package:biskota/screens/pages/detail_page.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DestinationTile extends StatelessWidget {
  final String newDestination;
  final String newLocation;
  final String newImageUrl;
  final double newRating;

  const DestinationTile({
    super.key,
    required this.newDestination,
    required this.newLocation,
    required this.newImageUrl,
    this.newRating = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailPage(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    newImageUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newDestination,
                    style: blackText.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    newLocation,
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
              newRating.toString(),
              style: blackText.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
