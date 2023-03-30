import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController confirmPassController = new TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void register() {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String pass = passController.text.trim();
    String confirmPass = confirmPassController.text.trim();

    print(email);
    print(name);
    print(lastName);
    print(phone);
    print(pass);
    print(confirmPass);
  }
}
