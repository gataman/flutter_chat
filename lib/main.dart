import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/view/login/landing_page.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'common/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //web options
/*
    options: const FirebaseOptions(
        apiKey: "AIzaSyDxEWeU9zrdLWiHLJoT2FpaPmf2Se4Cpxk",
        authDomain: "flutterchat-5f026.firebaseapp.com",
        projectId: "flutterchat-5f026",
        storageBucket: "flutterchat-5f026.appspot.com",
        messagingSenderId: "145969542058",
        appId: "1:145969542058:web:a4500d517de9070aad71d3",
        measurementId: "G-R14QF09XPP"),
 */
      );
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Lovers",
        theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: GoogleFonts.archivoNarrowTextTheme(
            Theme.of(context)
                .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          ),
        ),
        home: const LandingPage(),
      ),
    );
  }
}
