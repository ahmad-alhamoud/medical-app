import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/features/blog/presentation/screens/blog_screen.dart';
import 'package:medical_app/features/event/presentation/screens/event_screen.dart';
import 'package:medical_app/features/home/presentation/screens/home_screen.dart';
import 'package:medical_app/features/login/presentation/screens/login_screen.dart';
import 'package:medical_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:medical_app/main.dart';

import 'features/home/presentation/widgets/bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<Widget> _screens = [
  HomeScreen(),
  EventScreen(),
  BlogScreen(),
  ProfileScreen(),
];

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainBlue,
        currentIndex: _currentIndex,
        unselectedItemColor: AppColors.gray,
        iconSize: 15,
        backgroundColor: AppColors.whiteColor,
        type: BottomNavigationBarType.fixed ,
        elevation: 0,

        onTap: (page){
          setState(() {
            _currentIndex = page;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: context.localeString("home"),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Event"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "Blog"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomePageState();
// }
// class _HomePageState extends State<HomeScreen> {
//
//   late PersistentTabController _controller;
//
//   List<Widget> _buildScreens() {
//     return [
//       HomeScreen(),
//       EventScreen(),
//       BlogScreen(),
//       ProfileScreen()
//     ];
//   }
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.home),
//         title: ("Home"),
//         activeColorPrimary: AppColors.mainBlue,
//         inactiveColorPrimary: AppColors.whiteColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.archivebox_fill),
//         title: ("Archive"),
//         activeColorPrimary: AppColors.mainBlue,
//         inactiveColorPrimary: AppColors.whiteColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.cart_fill),
//         title: ("Cart"),
//         activeColorPrimary: AppColors.mainBlue,
//         inactiveColorPrimary: AppColors.whiteColor,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(CupertinoIcons.person),
//         title: ("Me"),
//         activeColorPrimary: AppColors.mainBlue,
//         inactiveColorPrimary: AppColors.whiteColor,
//       ),
//     ];
//   }
//   @override
//   void initState() {
//     _controller = PersistentTabController(initialIndex: 0);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white,
//       handleAndroidBackButtonPress: true,
//       resizeToAvoidBottomInset: true,
//       stateManagement: true,
//       hideNavigationBarWhenKeyboardShows: true,
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: const ItemAnimationProperties(
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//
//       navBarStyle: NavBarStyle.style1,
//     );
//   }
// }
//
//
