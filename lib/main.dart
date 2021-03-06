import 'package:provider/provider.dart';
import 'package:drive011221/Page/HomeScreen.dart';
import 'package:drive011221/cart.dart';
import 'package:drive011221/Screens/Home/message.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:io';
import 'package:drive011221/Screens/Home/HomeScreen.dart';
import 'package:drive011221/Screens/Home/home.dart';
import 'package:drive011221/Screens/Home/mainscreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:drive011221/login.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


var username;
FirebaseMessaging messaging = FirebaseMessaging.instance;
Future<void> _messageHandler(RemoteMessage message) async {
  print('b');
}
Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onMessageOpenedApp;


  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
 ]);


  HttpOverrides.global = MyHttpOverrides();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),

      ),
   );
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
//// getperf() async {
//   BuildContext context;
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//
//   if (preferences.getString("Path") != null) {
//
//   }
//   else if (preferences.getString("Path") == null) {
//     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
//         HomeScreen(name: username.text)));
//   }
//
// }
//
//

go(BuildContext context) async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  username=   preferences.getString("username");
  if(username!= null) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context)=>
          HomeScreen(name: username.text)),
          (Route<dynamic> route) => false,
    );


    print(username);
  }
  else
  {}
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> cart(),





      child: MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'HiTic',
          theme: ThemeData(fontFamily: 'Neo'),
          home: HomeScreeen()

      ),
    );

  }
}
