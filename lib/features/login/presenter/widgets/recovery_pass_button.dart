import 'package:flutter/material.dart';

class RecoveryPassButton extends StatelessWidget {
  const RecoveryPassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // recover pass
      },
      child: RichText(
        text: const TextSpan(
          text: 'Forgot your pass? ',
          style: TextStyle(color: Color.fromARGB(255, 2, 101, 114)),
          children: <TextSpan>[
            TextSpan(
                text: 'Click here',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}