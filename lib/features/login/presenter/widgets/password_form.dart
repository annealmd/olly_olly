import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'Senha',
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (value) {
          if (value!.length < 6) {
            return 'at least 6 caracteres';
          } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]+$')
              .hasMatch(value)) {
            return 'you need an Uppercase letter and a number';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
