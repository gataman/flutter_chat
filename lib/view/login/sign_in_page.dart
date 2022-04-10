import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/common/widgets/buttons/social_login_button.dart';
import 'package:flutter_lovers/view/login/sign_in_email_page.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Chat"),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Oturum Açın",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            SocialLoginButton(
              padding: 8,
              buttonText: "Google ile oturum aç",
              onPressed: () {
                _userViewModel.signInWithGoogle();
              },
              buttonColor: Colors.white,
              textColor: Colors.black54,
              radius: 20,
              fontSize: 16,
              height: 40,
              buttonIcon: Image.asset("images/google.png"),
            ),
            SocialLoginButton(
              padding: 8,
              buttonText: "Facebook ile oturum aç",
              onPressed: () {},
              buttonColor: const Color(0xFF334D92),
              textColor: Colors.white,
              radius: 20,
              fontSize: 16,
              height: 40,
              buttonIcon: Image.asset("images/facebook.png"),
            ),
            SocialLoginButton(
              padding: 8,
              buttonText: "Email ile oturum aç",
              onPressed: () {
                _signInWithEmail(context);
              },
              buttonColor: Colors.purple,
              textColor: Colors.white,
              radius: 20,
              fontSize: 16,
              height: 40,
              buttonIcon: const Icon(Icons.email),
            ),
            SocialLoginButton(
              padding: 8,
              buttonText: "Misafir olarak oturum aç",
              onPressed: () {
                _userViewModel.signInAnonymously();
              },
              buttonColor: Colors.teal,
              textColor: Colors.white,
              radius: 20,
              fontSize: 16,
              height: 40,
              buttonIcon: const Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => SignInWithEmail(),
      ),
    );
  }
}
