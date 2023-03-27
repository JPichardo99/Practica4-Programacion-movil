import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialtec/Screens/Login/login_screen.dart';
import 'package:socialtec/components/already_have_an_account_acheck.dart';
import 'package:socialtec/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late XFile? _imageFile = null;

  // validar correo
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa un correo electrónico.';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido.';
    }
    return null;
  }

  // validar nombre
  String? _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tu nombre.';
    }
    final numRegex = RegExp(r'^[A-Za-z\s]+$');
    if (!numRegex.hasMatch(value)) {
      return 'Por favor, ingresa un nombre valido.';
    }
    return null;
  }

  // validar apellidos
  String? _validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tus apellidos.';
    }
    final numRegex = RegExp(r'^[A-Za-z\s]+$');
    if (!numRegex.hasMatch(value)) {
      return 'Por favor, ingresa apellidos validos.';
    }
    return null;
  }

  // validar password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa una contraseña.';
    }
    return null;
  }

  void _selectImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (_imageFile != null)
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(File(_imageFile!.path)),
                  ),
                if (_imageFile == null)
                  CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: ElevatedButton(
                      onPressed: _selectImage,
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.zero,
                        elevation: 5,
                      ),
                      child: Icon(Icons.camera_alt, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onSaved: (firstname) {},
            controller: _firstNameController,
            validator: _validateFirstName,
            decoration: const InputDecoration(
              hintText: "Ingresa tu nombre",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(
                  Icons.person,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onSaved: (lastname) {},
            controller: _lastNameController,
            validator: _validateLastName,
            decoration: const InputDecoration(
              hintText: "Ingresa tus apellidos",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(
                  Icons.account_box,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSaved: (email) {},
            controller: _emailController,
            validator: _validateEmail,
            decoration: const InputDecoration(
              hintText: "Ingresa un email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(
                  Icons.account_circle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              textInputAction: TextInputAction.next,
              onSaved: (password) {},
              controller: _passwordController,
              validator: _validatePassword,
              decoration: const InputDecoration(
                hintText: "Ingresa una contraseña",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Si el formulario es válido, continuar con el envío
                Future.delayed(const Duration(milliseconds: 2000))
                    .then((value) {
                  Navigator.pushNamed(context, '/dash');
                });
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(kPrimaryLightColor),
            ),
            child: Text("Registrase".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
