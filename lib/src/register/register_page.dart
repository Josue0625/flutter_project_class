import 'package:flutter/material.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:delivery/src/register/register_controller.dart';
import 'package:flutter/scheduler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

RegisterController _con = new RegisterController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: _circleRegister(),
              left: -100,
              top: -100,
            ),
            Positioned(
              child: _textRegister(),
              left: 16,
              top: 52,
            ),
            Positioned(
              child: _iconBack(),
              left: -10,
              top: 38,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 128),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _imageUser(),
                    const SizedBox(height: 15),
                    _textFieldEmail(),
                    _textFieldName(),
                    _textFieldLastName(),
                    _textFieldPhone(),
                    _textFieldPassword(),
                    _textFieldConfirmPassword(),
                    _buttonRegister(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _imageUser() {
  return CircleAvatar(
    backgroundImage: const AssetImage('assets/img/user_profile_2.png'),
    radius: 50,
    backgroundColor: Colors.grey[200],
  );
}

Widget _circleRegister() {
  return Container(
    width: 240,
    height: 240,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100), color: MyColors.primaryColor),
  );
}

Widget _textFieldEmail() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
    decoration: BoxDecoration(
      color: MyColors.primaryOpacityColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      controller: _con.emailController,
      decoration: InputDecoration(
        hintText: 'Correo Electronico',
        hintStyle: TextStyle(color: MyColors.primaryColorDart),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(15),
        prefixIcon: Icon(
          Icons.email,
          color: MyColors.primaryColor,
        ),
      ),
    ),
  );
}

Widget _textFieldName() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
    decoration: BoxDecoration(
      color: MyColors.primaryOpacityColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      controller: _con.nameController,
        decoration: InputDecoration(
      hintText: 'Nombre',
      hintStyle: TextStyle(color: MyColors.primaryColorDart),
      border: InputBorder.none,
      contentPadding: EdgeInsets.all(15),
      prefixIcon: Icon(
        Icons.person,
        color: MyColors.primaryColor,
      ),
    )),
  );
}

Widget _textFieldLastName() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
    decoration: BoxDecoration(
      color: MyColors.primaryOpacityColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      controller: _con.lastNameController,
      decoration: InputDecoration(
        hintText: 'Apellido',
        hintStyle: TextStyle(color: MyColors.primaryColorDart),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(15),
        prefixIcon: Icon(
          Icons.person_outline,
          color: MyColors.primaryColor,
        ),
      ),
    ),
  );
}

Widget _textFieldPhone() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
    decoration: BoxDecoration(
      color: MyColors.primaryOpacityColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      keyboardType: TextInputType.phone,
      controller: _con.phoneController,
      decoration: InputDecoration(
        hintText: 'Telefono',
        hintStyle: TextStyle(color: MyColors.primaryColorDart),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(15),
        prefixIcon: Icon(
          Icons.phone,
          color: MyColors.primaryColor,
        ),
      ),
    ),
  );
}

Widget _textFieldPassword() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
    decoration: BoxDecoration(
      color: MyColors.primaryOpacityColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      obscureText: true,
      controller: _con.passController,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        hintStyle: TextStyle(color: MyColors.primaryColorDart),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(15),
        prefixIcon: Icon(
          Icons.lock,
          color: MyColors.primaryColor,
        ),
      ),
    ),
  );
}

Widget _textFieldConfirmPassword() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
    decoration: BoxDecoration(
      color: MyColors.primaryOpacityColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextField(
      obscureText: true,
      controller: _con.confirmPassController,
      decoration: InputDecoration(
        hintText: 'Confirmar Contraseña',
        hintStyle: TextStyle(color: MyColors.primaryColorDart),
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(15),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: MyColors.primaryColor,
        ),
      ),
    ),
  );
}

Widget _buttonRegister() {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
    child: ElevatedButton(
      onPressed: _con.register,
      child: Text('REGISTRARSE'),
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
    ),
  );
}

Widget _iconBack() {
  return IconButton(
    onPressed: () {},
    icon: Icon(
      Icons.arrow_back_ios,
      color: Colors.white,
    ),
  );
}

Widget _textRegister() {
  return const Text(
    'REGISTRO',
    style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'NimbusSans'),
  );
}
