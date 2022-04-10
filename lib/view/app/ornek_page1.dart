import 'package:flutter/material.dart';
import 'ornek_page2.dart';

class OrnekPage1 extends StatelessWidget {
  const OrnekPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Örnek 1"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const OrnekPage2()));
            },
            icon: const Icon(Icons.accessibility_outlined),
          )
        ],
      ),
      body: const Center(
        child: Text("Örnek1 sayfası"),
      ),
    );
  }
}
