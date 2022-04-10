import 'package:flutter/material.dart';
import 'package:flutter_lovers/view/home_page.dart';
import 'package:flutter_lovers/view/login/sign_in_page.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);

    if (_userViewModel.state == ViewState.idle) {
      if (_userViewModel.user == null) {
        return SignInPage();
      } else {
        return HomePage(_userViewModel.user!);
      }
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Chat"),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
