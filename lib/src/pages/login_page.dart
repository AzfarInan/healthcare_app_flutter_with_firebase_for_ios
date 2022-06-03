import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_flutter_firebase_ios_app/src/pages/register_page.dart';
import 'package:healthcare_flutter_firebase_ios_app/src/theme/extention.dart';

import '../theme/text_styles.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final ButtonStyle buttonStyle = TextButton.styleFrom(
    primary: Colors.white,
    minimumSize: const Size(360, 64),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0))),
    backgroundColor: const Color(0xFF052440),
  );

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    var email;
    var pass;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/heartbeat.png", color: Color(0xFF052440),height: 100,)),
            const Center(
              child: Text(
                "Time Health",
                style: TextStyle(
                    color: Color(0xFF052440),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Center(
              child: Text(
                "By healthcare Evolution",
                style: TextStyle(
                    color: Color(0xFF052440),
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 7.0, top: 32.0),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 31,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 7.0),
              child: Text(
                'Enter User Name and Password to login to your account.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              'User Name',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 6.0,
            ),
            SizedBox(
              height: 64.0,
              child: TextField(
                key: const Key('email'),
                cursorColor: const Color(0xFF7989AB),
                onChanged: (value) {
                  email = value;
                },
                autocorrect: false,
                enableSuggestions: false,
                style: const TextStyle(
                    color: Color(0xFF7989AB),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Color(0xFF052440),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7989AB)),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7989AB)),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7989AB)),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusColor: Color(0xFF7989AB),
                  hintText: 'Enter your user name',
                  hintStyle: TextStyle(
                      color: Color(0xFF7989AB),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Visibility(
                visible: false,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '* Invalid Email Format',
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                )),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Password',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 6.0,
            ),
            SizedBox(
              height: 64.0,
              child: TextField(
                key: const Key('pass'),
                obscureText: true,
                cursorColor: const Color(0xFF7989AB),
                onChanged: (value) {
                  pass = value;
                },
                autocorrect: false,
                enableSuggestions: false,
                style: const TextStyle(
                    color: Color(0xFF7989AB),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Color(0xFF052440),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7989AB)),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7989AB)),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF7989AB)),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusColor: Color(0xFF7989AB),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                      color: Color(0xFF7989AB),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            TextButton(
              key: const Key('login'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Login",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                  )
                ],
              ),
              style: buttonStyle,
              onPressed: () async {
                // if (!controller.invalidFormat.value &&
                //     controller.email.value.isNotEmpty &&
                //     controller.pass.value == '1234') {
                if (email != null &&
                    email != "" &&
                    pass != null &&
                    pass != "") {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email,
                            password: pass);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HomePage(
                                  name: userCredential.user!.email.toString(),
                                )));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      showDialog(context: context, builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text("Alert!"),
                          content: const Text("No user found for that email."),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("Okay"))
                          ],
                        );
                      });
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      showDialog(context: context, builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text("Alert!"),
                          content: const Text("Wrong password provided for that user."),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("Okay"))
                          ],
                        );
                      });
                      print('Wrong password provided for that user.');
                    }
                  }
                }
                // }
              },
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("If you don't have an account: "),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterPage()));
                  },
                  child: const Text(
                    "Tap here to Register",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF052440)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
