import 'package:demo/screens/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../login/login_vu.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUp>(builder: (context, provider, child) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Center(child: Text('Sign Up')),
          ),
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 75, 10, 0),
                  child: Form(
                    key: provider.providerformKey,
                    child: Center(
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
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              obscureText: provider.obscureText,
                              onSaved: provider.onEmailSaved,
                              validator: provider.emailValidator,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
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
                                child: const Text('Sign Up'),
                                onPressed: () {
                                  provider.providerformKey.currentState!.save();
                                  if (provider.providerformKey.currentState!
                                      .validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  }
                                },
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Already have an account?'),
                              TextButton(
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))),
        ),
      );
    });
  }
}
