import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

//=============== BottomNavigation Start=============//
class BottomNavigation extends StatefulWidget {
  final ValueChanged<int> changeTab;

  const BottomNavigation({Key? key, required this.changeTab}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: GNav(
          textStyle: TextStyle(
              fontFamily: "Mont",
              fontWeight: FontWeight.bold,
              color: colors.leftGradient),
          rippleColor: Colors.green[300]!,
          // onclick color
          hoverColor: Colors.green[50]!,
          // hover color
          gap: 2,
          activeColor: colors.leftGradient,
          // text color
          iconSize: 22,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: colors.leftGradientLight,
          color: colors.leftGradient,
          // outside icon color
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                widget.changeTab(1);
              },
            ),
            GButton(
              onPressed: () {
                widget.changeTab(3);
              },
              icon: Icons.person,
              text: 'Profile',
            ),
            // GButton(
            //   onPressed: () {
            //     widget.changeTab(4);
            //   },
            //   icon: Icons.dashboard,
            //   text: 'Dashboard',
            // ),
            GButton(
              onPressed: () {
                EasyLoading.showToast("screen is under development");
                return;
              },
              icon: Icons.support_agent_rounded,
              text: 'Help',
            ),
          ],
        ),
      ),
    );
  }
}
//=============== BottomNavigation End=============//
