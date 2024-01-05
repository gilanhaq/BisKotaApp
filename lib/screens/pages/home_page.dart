import 'package:biskota/cubit/auth_cubit.dart';
import 'package:biskota/cubit/destination_cubit.dart';
import 'package:biskota/models/model_destination.dart';
import 'package:biskota/screens/widgets/card_destination.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:biskota/screens/widgets/tile_destination.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  Widget header() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                        'Hello,\n${state.user.name}',
                        style: blackText.copyWith(
                          fontSize: 24,
                          fontWeight: semibold,
                        ),
                        overflow: TextOverflow.ellipsis,
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
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget popularDestinations(List<DestinationModel> destinations) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: destinations.map((DestinationModel destination) {
            return DestinationCard(destination);
          }).toList(),
        ),
      ),
    );
  }

  Widget newDestination(List<DestinationModel> destinations) {
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
          Column(
            children: destinations.map((DestinationModel destination) {
              return DestinationTile(destination);
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: error,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              header(),
              popularDestinations(state.destinations),
              newDestination(state.destinations),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
