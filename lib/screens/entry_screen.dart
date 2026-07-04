import 'package:flutter/material.dart';
import 'package:teach_advance/screens/dashboard_screen.dart';
import 'package:teach_advance/screens/profile.dart';
import 'package:teach_advance/utility/bottom_navigation.dart';
import 'package:teach_advance/screens/home_screen.dart';

// ignore: must_be_immutable
class EntryScreen extends StatefulWidget {
  int selectedTab;
  EntryScreen({Key? key, required this.selectedTab}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  getTab(int index) {
    switch (index) {
      case 1:
        return const HomeScreen();
      case 3:
        return const MyProfile();
      case 4:
        return const DashboardScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getTab(widget.selectedTab),
      bottomNavigationBar: BottomNavigation(
        changeTab: (ind) {
          if (ind != widget.selectedTab) {
            setState(() {
              widget.selectedTab = ind;
            });
          }
        },
      ),
    );
  }
}
