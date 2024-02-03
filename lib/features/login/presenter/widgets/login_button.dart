import 'package:flutter/material.dart';

import '../../../weather/presenter/mobile_ui/weather_page_mobile.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.formKey, required this.routeName,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          debugPrint(emailController.text);
          if (formKey.currentState!.validate()) {
            Navigator.popAndPushNamed(context, routeName);
          }
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ));
  }
}
