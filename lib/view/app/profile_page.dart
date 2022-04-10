import 'package:flutter/material.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        actions: [
          IconButton(
            onPressed: () {
              _userViewModel.signOut();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(
        child: Text("Profil sayfası"),
      ),
    );
  }
}
