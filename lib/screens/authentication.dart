import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/apis/authenticateTeachAPI.dart';
import 'package:teach_advance/controllers/authentication_controller.dart';
import 'package:teach_advance/utility/colors.dart' as colors;

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colors.leftGradient, colors.leftGradientLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Center(
            child: Container(
              height: height * 0.4,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 25.0,
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    brandNameWidget(),
                    Container(
                        margin: const EdgeInsets.all(4),
                        child: textFormField("Enter Phone Number", Icons.phone,
                            TextInputType.number, phoneNoController)),
                    Container(
                        margin: const EdgeInsets.all(4),
                        child: textFormField(
                            "Enter Password",
                            Icons.password_rounded,
                            TextInputType.number,
                            passwordController)),
                    GFButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        EasyLoading.show(dismissOnTap: true);
                        authenticateTeachAPI(
                            phoneNoController.text, passwordController.text);
                      },
                      blockButton: true,
                      color: colors.leftGradient,
                      text: "Login",
                      textStyle: const TextStyle(
                        fontFamily: "Mont",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final TextEditingController phoneNoController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final AuthenticationController authenticationController =
    Get.put(AuthenticationController());

Widget textFormField(labelText, icon, keyboardType, controller) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    initialValue: null,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(fontFamily: "Mont"),
      // errorText: 'Error message',
      border: const OutlineInputBorder(),
      prefixIcon: Icon(
        icon,
      ),
    ),
  );
}

Widget brandNameWidget() {
  return  const Padding(
    padding:  EdgeInsets.only(bottom: 24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 32.0,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        Text('get everything on your fingertip',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey,
                fontSize: 14.0,
                fontFamily: 'serif')), // Shimmer.fromColors(
      ],
    ),
  );
}
