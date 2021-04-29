import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/app_main_page.dart';
import 'package:chat_app/pages/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class SignPage extends StatelessWidget {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: appDefaultPadding),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness != Brightness.light
                    ? "assets/images/logo_light.jpg.png"
                    : "assets/images/logo_dark.png",
                height: 146,
              ),
              Spacer(),
              PrimaryButton(
                  text: "Entrar",
                  press: () => {
                        if (_currentUser != null)
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppMainPage(_currentUser),
                              ),
                            )
                          }
                      }),
              SizedBox(height: appDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Entrar com Google",
                press: () async {
                  _currentUser = await _googleSignIn.signIn();
                  if (_currentUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppMainPage(_currentUser),
                      ),
                    );
                  }
                },
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
