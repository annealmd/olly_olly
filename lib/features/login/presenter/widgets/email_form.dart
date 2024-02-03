import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          labelText: 'Email',
          filled: true,
          //fillColor: textFieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Informe um email';
          } else if (!value.contains('@')) {
            return 'Informe um email válido';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
