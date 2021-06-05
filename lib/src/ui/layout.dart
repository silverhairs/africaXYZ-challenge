import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:paypal_app/src/ui/home.dart';
import 'package:paypal_app/src/utils/styles.dart';

class MainLayout extends HookWidget {
  MainLayout({Key? key}) : super(key: key);

  final _screens = [
    HomeScreen(),
    Container(child: Center(child: Text("Nothing's here"))),
    Container(child: Center(child: Text("Nothing's here"))),
    Container(child: Center(child: Text("Nothing's here"))),
  ];

  @override
  Widget build(BuildContext context) {
    final screenIdx = useState(0);

    return Scaffold(
      bottomNavigationBar: Material(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: screenIdx.value,
          onTap: (idx) => screenIdx.value = idx,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.dark,
          selectedItemColor: AppColors.deepBlue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.homeOutline),
              label: 'Home',
              tooltip: 'Home',
              activeIcon: SizedBox(
                width: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(EvaIcons.homeOutline),
                    Text('Home', style: TextStyle(color: AppColors.deepBlue)),
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.peopleOutline),
              label: 'Contacts',
              tooltip: 'Contacts',
              activeIcon: SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(EvaIcons.peopleOutline),
                    Text(
                      'Contacts',
                      style: TextStyle(color: AppColors.deepBlue),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterRemix.wallet_2_line),
              label: 'Wallet',
              tooltip: 'Wallet',
              activeIcon: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(FlutterRemix.wallet_2_line),
                    Text(
                      'Wallet',
                      style: TextStyle(color: AppColors.deepBlue),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.settings2Outline),
              label: 'Settings',
              tooltip: 'Settings',
              activeIcon: SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(EvaIcons.settings2Outline),
                    Text(
                      'Settings',
                      style: TextStyle(color: AppColors.deepBlue),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: _screens[screenIdx.value],
    );
  }
}
