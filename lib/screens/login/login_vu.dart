import 'package:demo/screens/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Login>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Login')),
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 75, 10, 0),
                  child: Form(
                    key: provider.loginformKey,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            onSaved: provider.onUsernameSaved,
                            validator: provider.usernameValidator,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            onSaved: provider.onPasswordSaved,
                            validator: provider.passwordValidator,
                            obscureText: provider.obscureText,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  provider.onObsecure();
                                },
                                child: SvgPicture.asset(
                                    provider.obscureText
                                        ? 'assets/icons/show_password_icon.svg'
                                        : 'assets/icons/hide_password_icon.svg',
                                    fit: BoxFit.scaleDown),
                              ),
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              child: const Text('Login'),
                              onPressed: () async {
                                provider.login(context);
                              },
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Does not have account?'),
                            TextButton(
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ))),
        ),
      );
    });
  }
}
