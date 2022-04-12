import 'package:flutter/material.dart';
import 'package:drive011221/Page/commet.dart';

import 'package:drive011221/Page/tras.dart';
import 'package:drive011221/Widget/appbar.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import 'package:drive011221/Widget/drawer.dart';
import 'package:drive011221/Widget/posts.dart';
import 'package:drive011221/theme/color.dart';
class tester extends StatefulWidget {
  @override
  _testerState createState() => _testerState();
}

class _testerState extends State<tester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 //     appBar: myappbar(context),
      body: postslist(),
    );
  }
}
