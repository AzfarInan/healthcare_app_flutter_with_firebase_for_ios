import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Center(child: Image.asset("assets/heartbeat.png", color: Colors.red.shade900, height: 100,)),
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
                'Welcome!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 31,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 7.0),
              child: Text(
                'Enter your Email and set a Password to Register for your account.',
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
              'Email Address',
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
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(
                      color: Color(0xFF7989AB),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
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
                cursorColor: const Color(0xFF7989AB),
                onChanged: (value) {
                  pass = value;
                },
                obscureText: true,
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
                    "Register",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  // const SizedBox(
                  //   width: 12.0,
                  // ),
                  // const Icon(
                  //   Icons.arrow_forward_outlined,
                  //   color: Colors.white,
                  // )
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
                    UserCredential? userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: pass);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HomePage(
                              name: userCredential.user!.email.toString(),
                            )));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showDialog(context: context, builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text("Alert!"),
                          content: const Text("The password provided is too weak. Please provide a password of 6 digit long"),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("Okay"))
                          ],
                        );
                      });
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      showDialog(context: context, builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text("Alert!"),
                          content: const Text("The account already exists for that email."),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("Okay"))
                          ],
                        );
                      });
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                }
                // }
              },
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Already have an account?"),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    " Login",
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
