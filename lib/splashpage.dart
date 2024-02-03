import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/features/login/presenter/mobile_ui/login_page.dart'
    as mobile_ui;
import 'package:weather/features/login/presenter/web_ui/login_page.dart'
    as web_ui;

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      var web = MediaQuery.of(context).size.width > 600;
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.popAndPushNamed(context,
            web ? web_ui.LoginPage.routeName : mobile_ui.LoginPage.routeName);
      });
    });
    return Scaffold(
      bottomSheet: const Image(
        image: AssetImage('assets/images/bottom_image.png'),
        fit: BoxFit.fill,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/images/logo.svg',

            fit: BoxFit.fill, // Adjust the BoxFit as needed
          ),
        ),
      ),
    );
  }
}
