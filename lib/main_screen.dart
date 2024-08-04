import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'package:medical_app/core/config/colors.dart';
import 'package:medical_app/core/di/injection.dart';
import 'package:medical_app/features/blog/logic/blog_cubit.dart';
import 'package:medical_app/features/blog/presentation/screens/blog_screen.dart';
import 'package:medical_app/features/disease/logic/diseases_cubit.dart';
import 'package:medical_app/features/home/presentation/screens/home_screen.dart';

import 'package:medical_app/features/session/logic/session_cubit.dart';

import 'features/disease/presentation/screens/diseases_screen.dart';
import 'features/session/presentation/screens/sessions_screen.dart';




class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<Widget> _screens = [
  HomeScreen(),
  SessionsScreen(),
  DiseasesScreen(),
  BlogScreen(),

];

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<BlogCubit>()),
        BlocProvider(create: (context) => getIt<SessionCubit>()),
        BlocProvider(create: (context) => getIt<DiseasesCubit>()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: _screens[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(16 ),
          child: Container(
            height: 64,
            color: AppColors.whiteColor,
            margin: EdgeInsets.all(24),
            child: BottomNavigationBar(
              selectedItemColor: AppColors.mainBlue,
              currentIndex: _currentIndex,
              unselectedItemColor: AppColors.gray,
              iconSize: 15,
              backgroundColor: AppColors.whiteColor,
              type: BottomNavigationBarType.fixed ,
              showUnselectedLabels: false,
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
                BottomNavigationBarItem(icon: Icon(Icons.medical_services_rounded), label: context.localeString("sessions")),
                BottomNavigationBarItem(icon: Icon(Icons.monitor_heart_rounded), label: context.localeString("diseases")),
                BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "Blog"),
              ],
            ),
          ),
        ),
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
