import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:demo_workerhub/LoginScreen.dart';
import 'package:demo_workerhub/regScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,    //
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: LoginScreen(),
      title: new Text('Kaam ki Khoj, Nayi Soch',textScaleFactor: 2,),
      image: new Image(image: AssetImage('assets/logo.png')),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Worker Hub")),
      body: Center(
          child:Text("Login page",textScaleFactor: 2,)
      ),
    );
  }
}