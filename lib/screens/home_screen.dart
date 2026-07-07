import 'package:flutter/material.dart';
import 'package:teach_advance/utility/appbar.dart';
import 'package:teach_advance/utility/new_set_floating_action_button.dart';
import '../apis/getMySetsAPI.dart';
import '../utility/home_screen_tab_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(["prasnKOSH"]),
          body: Column(
            children: [
              // appBarNew("Teach", 24.0, 10.0, 10.0),
              // chipInList(Colors.red, Colors.blue, "Alpha"),
              Expanded(child: homeScreenTabBar(context)),
            ],
          ),
          floatingActionButton: newSetFloatingActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat),
    );
  }
}
