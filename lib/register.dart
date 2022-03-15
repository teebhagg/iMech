import 'package:auto_/main.dart';

import 'homepage.dart';
import 'terms-and-conditions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    // DatabaseReference dbRef =
    //     FirebaseDatabase.instance.ref().child("Mech, Auto and Tows");
    TextEditingController emailController = TextEditingController();
    TextEditingController companyController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    displayToastMessage(String message, BuildContext context) {
      Fluttertoast.showToast(
        msg: message,
        timeInSecForIosWeb: 5,
      );
    }

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    registerNewUser(BuildContext context) async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Mydialog(message: "Signing in ");
          });
      final User? firebaseUser = (await _firebaseAuth
              .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text)
              .catchError((errMsg) {
        Navigator.pop(context);
        displayToastMessage("Error: " + errMsg.toString(), context);
      }))
          .user;
      if (firebaseUser != null) {
        //save user info to database

        Map UserDataMap = {
          "email": emailController.text,
          "password": passwordController.text,
          "company": companyController.text,
          "address": addressController.text,
          "location": locationController.text,          
          "number": numberController.text,
        };
        UserRef.child(firebaseUser.uid).set(UserDataMap);
        displayToastMessage("Account has been created successful", context);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TermsConditions()));
      } else {
        Navigator.pop(context);
        displayToastMessage("Account has not been created.Try Again", context);
      }
    }

    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 240,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amberAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () {
                  registerNewUser(context);
                  // },

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const TermsConditions(),
                  //   ),
                  // );
                  // } else {}
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.grey, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Form(
          key: _formKey,
          child: ListView(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text('Registration',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: 'E-mail', border: InputBorder.none),
                      validator: (emailController) {
                        if (emailController!.isEmpty) {
                          return "Email can't be empty";
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(emailController)) {
                          return null;
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 60,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          hintText: 'Password', border: InputBorder.none),
                      validator: (passwordController) {
                        if (passwordController!.isEmpty) {
                          return "Password can't be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 60,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: companyController,
                      decoration: const InputDecoration(
                          hintText: 'Name of Company',
                          border: InputBorder.none),
                      validator: (companyController) {
                        if (companyController!.isEmpty) {
                          return "Company can't be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 60,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: numberController,
                      decoration: const InputDecoration(
                          hintText: 'Tel. Number', border: InputBorder.none),
                      validator: (numberController) {
                        if (numberController!.isEmpty) {
                          return "Tel. Number can't be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 60,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: locationController,
                      decoration: const InputDecoration(
                          hintText: 'Location', border: InputBorder.none),
                      validator: (locationController) {
                        if (locationController!.isEmpty) {
                          return "Location can't be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 60,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(
                          hintText: 'Address', border: InputBorder.none),
                      validator: (addressController) {
                        if (addressController!.isEmpty) {
                          return "Address can't be empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Registered?',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogIn(),
                          ),
                        );
                      },
                      child: Text('Log In'),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

// final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   registerNewUser(BuildContext context) async {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Mydialog(message: "Signing in ");
//         });
//     final User? firebaseUser = (await _firebaseAuth
//             .createUserWithEmailAndPassword(
//                 email: emailController.text,
//                 password: passwordController.text)
//             .catchError((errMsg) {
//       Navigator.pop(context);
//       displayToastMessage("Error: " + errMsg.toString(), context);
//     }))
//         .user;
//     if (firebaseUser != null) {
//       //save user info to database

//       Map UserDataMap = {
//         "email": emailController.text,
//         "password": passwordController.text,
//         "username": usernameController.text,
//       };
//       usersRef.child(firebaseUser.uid).set(UserDataMap);
//       displayToastMessage("Account has been created successful", context);

//       // Navigator.push(
//       //     context, MaterialPageRoute(builder: (context) => Navi()));
//     } else {
//        Navigator.pop(context);
//       displayToastMessage("Account has not been created.Try Again", context);
//     }
//   }

//   displayToastMessage(String message, BuildContext context) {
//     Fluttertoast.showToast(msg: message, timeInSecForIosWeb: 5,);
//   }
// }

class Mydialog extends StatelessWidget {
  final message;
  const Mydialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                width: 6,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                message,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    DatabaseReference dbRef =
        FirebaseDatabase.instance.reference().child("Mech, Auto and Tows");
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    displayToastMessage(String message, BuildContext context) {
      Fluttertoast.showToast(
        msg: message,
        timeInSecForIosWeb: 10,
      );
    }

    loginAndAuthenticateUser(BuildContext context) async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Mydialog(message: "Logging in ........");
          });
      final User? firebaseUser = (await _firebaseAuth
              .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text)
              .catchError((errMsg) {
        Navigator.pop(context);
        displayToastMessage("Error: " + errMsg.toString(), context);
      }))
          .user;
      if (firebaseUser != null) {
        //save user info to database

        dbRef.child(firebaseUser.uid).get().then((DataSnapshot snap) async {
          if (snap.value != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            displayToastMessage(
                "Account has been logged in successful", context);
          } else {
            Navigator.pop(context);
            await _firebaseAuth.signOut();
            displayToastMessage(
                "Account has not been created.Try Again", context);
          }
        });
      } else {
        Navigator.pop(context);
        displayToastMessage("Error Loging in", context);
      }
    }

    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 240,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amberAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginAndAuthenticateUser(context);
                  } else {}
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text('Log In',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ),
              ),
              Container(
                height: 60,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email or Tel. Number',
                        border: InputBorder.none),
                    validator: (companyController) {
                      if (companyController!.isEmpty) {
                        return "Email or Tel. Number can't be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        hintText: 'Password', border: InputBorder.none),
                    validator: (companyController) {
                      if (companyController!.isEmpty) {
                        return "Password can't be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
