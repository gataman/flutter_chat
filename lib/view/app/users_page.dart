import 'package:flutter/material.dart';
import 'package:flutter_lovers/view/app/ornek_page1.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcılar"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const OrnekPage1()));
            },
            icon: const Icon(Icons.zoom_in_sharp),
          )
        ],
      ),
      body: const Center(
        child: Text("Kullanıcılar sayfası"),
      ),
    );
  }
}
