import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:teach_advance/screens/dashboard_screen.dart';
import 'package:teach_advance/screens/home_screen.dart';
import 'package:teach_advance/screens/profile.dart';
import 'package:teach_advance/utility/bottom_navigation.dart';

ReceivePort port = ReceivePort();

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
  void initState() {
    // TODO: implement initState
    super.initState();
   // determinePosition() ;
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



  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
