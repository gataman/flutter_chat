import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/common/widgets/text_fields/text_form_field_login.dart';
import 'package:flutter_lovers/commons.dart';
import 'package:flutter_lovers/model/user/user_model.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class SignInWithEmail extends StatefulWidget {
  @override
  _SignInWithEmailState createState() => _SignInWithEmailState();
}

class _SignInWithEmailState extends State<SignInWithEmail> {
  bool isLogin = true;
  var formKey = GlobalKey<FormState>();
  var tfEmail = TextEditingController();
  var tfPassword = TextEditingController();
  var tfPassword2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (formKey.currentState != null) {
      formKey.currentState!.reset();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş / Kayıt"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _isLogin(isLogin),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _isLogin(bool isLogin) {
    if (isLogin) {
      return loginForm();
    } else {
      return registerForm();
    }
  }

  List<Widget> registerForm() {
    return [
      const Text(
        "Kayıt Ol",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormFieldLogin(
        label: "Email",
        controller: tfEmail,
        validator: (text) {
          return Commons.validateEmail(text);
        },
        radius: 20,
        prefixIcon: const Icon(Icons.email_outlined),
      ),
      TextFormFieldLogin(
        label: "Şifre",
        controller: tfPassword,
        validator: (text) {
          if (text!.length < 6) {
            return "Şifreniz en az 6 karakter olmalıdır!";
          }
        },
        radius: 20,
        prefixIcon: const Icon(Icons.lock_outline),
        isSecure: true,
      ),
      TextFormFieldLogin(
        label: "Şifre (tekrar)",
        controller: tfPassword2,
        validator: (text) {
          if (text!.length < 6) {
            return "Şifreniz en az 6 karakter olmalıdır!";
          } else if (tfPassword.text != text) {
            return "Şifreler uyuşmuyor";
          }
          return null;
        },
        radius: 20,
        prefixIcon: const Icon(Icons.lock_outline),
        isSecure: true,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isLogin = true;
                  });
                },
                child: Text("Giriş Yap"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  var result = formKey.currentState!.validate();
                  if (result) {
                    doIt();
                  }
                  /*
                setState(() {
                  this.isLogin = false;
                });

                 */
                },
                child: Text("Kayıt Ol"),
              ),
            ),
          ),
        ],
      )
    ];
  }

  List<Widget> loginForm() {
    return [
      const Text(
        "Giriş Yap",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormFieldLogin(
        label: "Email",
        controller: tfEmail,
        validator: (text) {
          return Commons.validateEmail(text);
        },
        radius: 20,
        prefixIcon: const Icon(Icons.email_outlined),
      ),
      TextFormFieldLogin(
        label: "Şifre",
        controller: tfPassword,
        validator: (text) {
          if (text!.length < 6) {
            return "Şifreniz en az 6 karakter olmalıdır!";
          }
        },
        radius: 20,
        prefixIcon: const Icon(Icons.lock_outline),
        isSecure: true,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 4),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isLogin = false;
                  });
                },
                child: Text("Kayıt Ol"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  var result = formKey.currentState!.validate();
                  if (result) {
                    doIt();
                  }

                  /*
                setState(() {
                  this.isLogin = false;
                });

                 */
                },
                child: Text("Giriş Yap"),
              ),
            ),
          ),
        ],
      )
    ];
  }

  void doIt() async {
    String email = tfEmail.text;
    String password = tfPassword.text;

    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);

    if (isLogin) {
      UserModel? user =
          await _userViewModel.signInWithEmailAndPassword(email, password);
    } else {
      UserModel? user =
          await _userViewModel.createUserWithEmailAndPassword(email, password);

      if (user != null) {
        if (user.exception is FirebaseAuthException) {
          FirebaseAuthException e = user.exception as FirebaseAuthException;

          if (e.code == 'weak-password') {
            showAlertDialog("Sağlanan şifre çok zayıf!");
          } else if (e.code == 'email-already-in-use') {
            showAlertDialog(
                "Bu email adresiyle daha önce kayıt oluşturulmuş, lütfen giriş yapın!");
          } else {
            // Giriş yap!
            showAlertDialog("Kayıt oluşturulurken bir hata oluştu Hata: $e");
          }
        } else {
          showAlertDialog(
              "Kayıt oluşturulurken bir hata oluştu Hata: ${user.exception.toString()}");
          debugPrint(user.exception.toString());
        }
      } else {
        showAlertDialog("Kayıt oluşturulurken bir hata oluştu.");
      }
    }
  }

  void showAlertDialog(String message) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Hata'),
        content: Text(message),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('Kapat'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
