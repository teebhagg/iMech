// import 'dart:developer';

import 'package:auto_/chat_page.dart';
import 'package:auto_/controller.dart';
import 'package:auto_/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'appointmentpage_view.dart';
import 'register.dart';
import 'services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Getid getid = Getid();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.black,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Start(),
              ),
            );
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.exit_to_app_rounded,
                  size: 28,
                  color: Colors.amberAccent,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w300),
                )
              ]),
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Future<String> postservices() async {
      User? user = FirebaseAuth.instance.currentUser;
      DatabaseReference UserRef = FirebaseDatabase.instance
          .ref()
          .child('Mech, Auto and Tows')
          .child(user!.uid);
      final idsnapshot = await UserRef.child('Services').get();
      print(idsnapshot.value);
      return idsnapshot.value as String;
    }
        }, icon: Icon(Icons.notifications)),
        actions: [
          IconButton(
              onPressed: () async {
                String sirprince = await getid.username();
              },
              icon: const Icon(Icons.settings))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(children: [
          // Padding(
          //   padding: const EdgeInsets.all(14.0),
          //   child: Image.asset(
          //     'img/tires.png',
          //     width: 120,
          //     height: 120,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: FutureBuilder<String>(
                  future: getid.username(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      );
                    }
                    return const Text('Autoshops');
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Services()),
                    ),
                  );
                },
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.settings,
                        size: 40,
                      ),
                      Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(15)))),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => ChatPage()),
                    ),
                  );
                },
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.chat_rounded, size: 40),
                      Text('Chats',
                          style: TextStyle(
                            fontSize: 19,
                          ))
                    ],
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(15)))),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.072,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => AppointmentPage()),
                    ),
                  );
                },
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.calendar_today_rounded, size: 40),
                      Text('Appointments',
                          style: TextStyle(
                            fontSize: 19,
                          ))
                    ],
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(15)))),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
