import 'package:flutter/material.dart';
import 'package:drive011221/Page/Details.dart';
import 'package:drive011221/Widget/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class searach extends StatefulWidget {

  @override
  _searachState createState() => _searachState();
}

class _searachState extends State<searach> {
  //
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder:(BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context,i) {
              return InkWell(
                child: Container(
                  height: 250,

                  width: 150,
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(child:
                        Image.network("https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-red-select-2020?wid=470&hei=556&fmt=jpeg&qlt=95&.v=1604343703000",)),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mname


                          children: [

                            Text(snapshot.data[i]['mname'],style: TextStyle(fontWeight: FontWeight.w600),),
                            Text("المواصفات",style: TextStyle(fontWeight: FontWeight.w600),),


                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("ذاكرة"),
                                      Text(" 5G",style: TextStyle(color: Colors.deepOrange)),
                                    ],
                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [

                                      Text("السعر"),
                                      Text(" 500\$",style: TextStyle(color: Colors.deepOrange)),
                                    ],
                                  ),

                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text("المعالج"),
                                      Text(" 5G",style: TextStyle(color: Colors.deepOrange)),
                                    ],
                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [

                                      Text("البطارية"),
                                      Text(" 50",style: TextStyle(color: Colors.deepOrange)),
                                    ],
                                  ),

                                ),


                              ],
                            ),
                            Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [

                                      Text("السعر"),
                                      Text(" 500\$",style: TextStyle(color: Colors.deepOrange)),
                                    ],
                                  ),

                                ),


                              ],
                            ),

                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              );
            });
          }
          else
            return CircularProgressIndicator();

        }
    );
  }
}
