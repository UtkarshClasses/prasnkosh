import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teach_advance/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:teach_advance/utility/colors.dart' as colors;
import 'package:teach_advance/utility/containerPro.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileManagement profileManagementController =
        Get.put(ProfileManagement());
    profileManagementController.profileReadOnly.value = true;
    final userDetails = GetStorage();
    final TextEditingController profilePhoneNoController =
        TextEditingController();
    final TextEditingController profileWhatsappNoController =
        TextEditingController();
    final TextEditingController instituteNameController =
        TextEditingController();
    final TextEditingController teacherNameController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "My Profile ",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Mont",
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    containerPro(
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 6.0),
                          child: Text(
                            "${userDetails.read("user_id")}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: "Mont",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        colors.leftGradient,
                        Colors.blueGrey,
                        4.0,
                        4.0),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 128,
                      width: 128,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        // color: Colors.grey.shade200,
                      ),
                      child: Image.network(userDetails.read("logo_url")),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 20, right: 20),
                child: decoratedBoxWithTextField(
                    "Institute Name",
                    userDetails.read("institute_name"),
                    instituteNameController,
                    profileManagementController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 20, right: 20),
                child: decoratedBoxWithTextField(
                    "Teacher Name",
                    userDetails.read("teacher_name"),
                    teacherNameController,
                    profileManagementController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 20, right: 20),
                child: decoratedBoxWithTextField(
                    "Calling Number",
                    userDetails.read("phone_no"),
                    profilePhoneNoController,
                    profileManagementController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 20, right: 20),
                child: decoratedBoxWithTextField(
                    "Whatsapp Number",
                    userDetails.read("whatsapp_no"),
                    profileWhatsappNoController,
                    profileManagementController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 20, right: 20),
                child: Obx(() => GFButton(
                      onPressed: () {
                        if (profileManagementController.profileReadOnly.value ==
                            false) {
                          if (profilePhoneNoController.text.length > 10 ||
                              profilePhoneNoController.text.length < 10 ||
                              profileWhatsappNoController.text.length > 10 ||
                              profileWhatsappNoController.text.length < 10) {
                            EasyLoading.showToast("requires 10 digit number");
                          } else {
                            profileManagementController.updateProfile(
                                instituteNameController.text,
                                teacherNameController.text,
                                profilePhoneNoController.text,
                                profileWhatsappNoController.text);
                            EasyLoading.show(
                                status: "Updating Profile", dismissOnTap: true);
                            profileManagementController.profileReadOnly.value ==
                                true;
                          }
                        } else {
                          EasyLoading.showToast("Edit mode enabled",
                              toastPosition: EasyLoadingToastPosition.center,
                              duration: const Duration(milliseconds: 200));
                        }
                        profileManagementController.profileReadOnly.value =
                            !profileManagementController.profileReadOnly.value;
                      },
                      text: profileManagementController.profileReadOnly.value
                          ? "Edit"
                          : "Update",
                      textStyle: const TextStyle(
                        fontFamily: "Mont",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      color: colors.leftGradient,
                      type: GFButtonType.solid,
                      fullWidthButton: true,
                      size: 44,
                    )),
              ),
              GestureDetector(
                onTap: () {
                  changePassword();
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 15),
                  child: Text(
                    "change password",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

changePassword() {
  final ProfileManagement profileManagementController =
      Get.put(ProfileManagement());
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  return Get.defaultDialog(
    content: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0, left: 6, right: 6),
          child: TextField(
            obscureText: true,
            obscuringCharacter: "*",
            controller: currentPassword,
            decoration: const InputDecoration(
                hintText: "Current Password",
                hintStyle: TextStyle(fontFamily: "serif"),
                labelStyle: TextStyle(color: Color(0xFF424242)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0, left: 6, right: 6),
          child: TextField(
            obscureText: true,
            obscuringCharacter: "*",
            controller: newPassword,
            decoration: const InputDecoration(
                hintText: "New Password",
                hintStyle: TextStyle(fontFamily: "serif"),
                labelStyle: TextStyle(color: Color(0xFF424242)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0, left: 6, right: 6),
          child: TextField(
            controller: newPassword,
            decoration: const InputDecoration(
                hintText: "Confirm New Password",
                hintStyle: TextStyle(fontFamily: "serif"),
                labelStyle: TextStyle(color: Color(0xFF424242)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
      ],
    ),
    confirm: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.leftGradient,
          ),
          onPressed: () async {
            if (newPassword.text.length > 3 && newPassword.text.length > 3) {
              Get.back();
              profileManagementController.changePassword(
                  currentPassword.text, newPassword.text);
            } else {
              EasyLoading.showToast(
                  "password minimum length should be 4 characters",
                  toastPosition: EasyLoadingToastPosition.center);
            }
          },
          child: const Text(
            'Change Password',
            style: TextStyle(
              fontFamily: 'Mont',
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )),
    ),
    title: "",
    titlePadding:
        const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 4.0, right: 4.0),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Mont",
      fontSize: 18,
    ),
    radius: 6,
    buttonColor: colors.leftGradient,
  );
}

Widget decoratedBoxWithTextField(
    title, hintText, controller, profileManagementController) {
  controller.text = hintText.toString();
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 2.0,
            ),
            child: Text(title,
                style: const TextStyle(
                  fontFamily: "Mont",
                  fontSize: 16,
                  // fontWeight: FontWeight.w900,
                )),
          ),
        ],
      ),
      Obx(() => TextFormField(
            controller: controller,
            onChanged: (value) {
              controller.text = value;
              controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length));
            },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              fontFamily: "serif",
              color: Colors.black,
            ),
            readOnly: profileManagementController.profileReadOnly.value,
          ))
    ],
  );
}
