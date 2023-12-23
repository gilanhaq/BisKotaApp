import 'package:biskota/cubit/page_cubit.dart';
import 'package:biskota/screens/pages/home_page.dart';
import 'package:biskota/screens/pages/setting_page.dart';
import 'package:biskota/screens/pages/transaction_page.dart';
import 'package:biskota/screens/pages/wallet_page.dart';
import 'package:biskota/screens/widgets/custom_bottomnav_item.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: backgroud,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: dark.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavItem(
                index: 0,
                icon: 'assets/svgs/ic_home.svg',
              ),
              CustomBottomNavItem(
                index: 1,
                icon: 'assets/svgs/ic_booking.svg',
              ),
              CustomBottomNavItem(
                index: 2,
                icon: 'assets/svgs/ic_card.svg',
              ),
              CustomBottomNavItem(
                index: 3,
                icon: 'assets/svgs/ic_settings.svg',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backgroud,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
