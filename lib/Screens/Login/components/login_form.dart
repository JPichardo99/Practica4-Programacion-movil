import 'package:flutter/material.dart';
import 'package:socialtec/Screens/Login/components/socal_login.dart';
import 'package:socialtec/Screens/Signup/signup_screen.dart';
import 'package:socialtec/components/already_have_an_account_acheck.dart';
import 'package:socialtec/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

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

    // validar password
    String? _validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Por favor, ingresa una contraseña.';
      }
      return null;
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
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
                  child: Icon(
                    Icons.lock,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Si el formulario es válido, continuar con el envío
                Future.delayed(const Duration(milliseconds: 500)).then((value) {
                  Navigator.pushNamed(context, '/dash');
                });
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(kPrimaryLightColor),
            ),
            child: Text("Iniciar sesion".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
          SocalSignUp(),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
