import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'register.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      // DevicePreview(enabled: true, builder: (context) =>
      MyApp());
}

DatabaseReference UserRef =
    FirebaseDatabase.instance.ref().child('Mech, Auto and Tows');

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Start(),
    );
  }
}

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SizedBox(
        width: 250.0,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText('THE ',
                  textStyle: const TextStyle(color: Colors.black)),
              FadeAnimatedText('THE MECHANIC',
                  textStyle: const TextStyle(color: Colors.black)),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ),
    );
  }
}
