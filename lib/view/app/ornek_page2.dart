import 'package:flutter/material.dart';

class OrnekPage2 extends StatelessWidget {
  const OrnekPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Örnek 2"),
      ),
      body: const Center(
        child: Text("Örnek2 sayfası"),
      ),
    );
  }
}
