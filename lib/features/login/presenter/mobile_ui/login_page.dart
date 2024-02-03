import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dependency_injection/dependency_injector.dart';
import '../widgets/email_form.dart';
import '../widgets/password_form.dart';
import '../../../weather/presenter/mobile_ui/weather_page_mobile.dart';
import '../blocs/internet/internet_cubit.dart';
import '../functions/show_alert_dialog.dart';
import '../widgets/login_button.dart';
import '../widgets/recovery_pass_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  static const routeName = '/mobile_login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final internetCubit = DependencyInjector().get<InternetCubit>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    internetCubit.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: const Image(
        image: AssetImage('assets/images/bottom_image.png'),
        fit: BoxFit.fill,
      ),
      body: BlocListener<InternetCubit, InternetState>(
        bloc: internetCubit,
        listener: (context, state) {
          if (state is InternetDisconnected) {
            showAlertDialog(context);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EmailWidget(emailController: emailController),
                  PasswordWidget(passwordController: passwordController),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    child: LoginButton(
                      emailController: emailController,
                      formKey: formKey,
                      routeName: WeatherPage.routeName,
                    ),
                  ),
                  const RecoveryPassButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
