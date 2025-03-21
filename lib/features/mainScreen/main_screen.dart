import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:ecommerce_pojo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({required this.child, super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0; // Tracks the active tab
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: Styles().getCaptionSemiBoldStyle(color: Theme.of(context).cardColor),
        unselectedLabelStyle: Styles().getCaptionRegularStyle(color: Theme.of(context).hoverColor),
        selectedIconTheme:  IconThemeData(size: 24.sp , color: Theme.of(context).primaryColor),
        unselectedIconTheme:  IconThemeData(size: 24.sp , color: Theme.of(context).hoverColor),
        selectedItemColor: Theme.of(context).cardColor,
        unselectedItemColor: Theme.of(context).hoverColor,
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(icon: buildNavItem('home', 0), label: 'Home'),
          BottomNavigationBarItem(
              icon: buildNavItem('category', 1), label: 'Categories'),
          BottomNavigationBarItem(icon: buildNavItem('cart', 2), label: 'Cart'),
          BottomNavigationBarItem(
              icon: buildNavItem('wishlist', 3), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: buildNavItem('profile', 4), label: 'Profile'),
        ],
      ),
    );
  }

  Widget buildNavItem(String imageName, int index) {
    return selectedIndex == index
        ? ImageIcon(
            size: 24.sp,
            AssetImage('assets/icons/${imageName}_2.png'),
          )
        : ImageIcon(
            size: 24.sp,
            AssetImage('assets/icons/${imageName}_1.png'),
          );
  }

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 0:
        GoRouter.of(context).go(PageRouteName.home);
        break;
      case 1:
        GoRouter.of(context).go(PageRouteName.categories);
        break;
      case 2:
        GoRouter.of(context).go(PageRouteName.cart);
        break;
      case 3:
        GoRouter.of(context).go(PageRouteName.wishlist);
        break;
      case 4:
        GoRouter.of(context).go(PageRouteName.profile);
        break;
    }
  }
}
