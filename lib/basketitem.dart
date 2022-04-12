

import 'dart:convert';

//import 'package:fluttertoast/fluttertoast.dart';
import 'package:drive011221/Widget/drawer.dart';
import 'package:drive011221/cart.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;


import "package:flutter/material.dart";
import 'package:drive011221/model/cart.dart';
import 'package:provider/provider.dart';
import 'package:drive011221/theme/color.dart';

class basket extends StatefulWidget {



  @override
  _basketState createState() => _basketState();
}

class _basketState extends State<basket> {
  @override
  Widget build(BuildContext context) {
    return Directionality(      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: drawer(),
        appBar: AppBar(title:
        Consumer<cart>(builder: (context,cart,chlid)
        {
          return Text(cart.total.toString()+" \$");
        }


        ),
          backgroundColor: primary,
          actions: [
            Consumer<cart>(builder: (context,cart,chlid)
            {
              return   Padding(

                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton (
                      color: sh,

                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                      onPressed: (

                          )  async {

                        SharedPreferences preferences=await SharedPreferences.getInstance();
                        String username=  preferences.getString("username").toString();
                        if(username!=null) {

                          String hireID;
                          List<String> id=[];
                          for(int i=0;i< cart.basketitem.length;i++){
                            id.addAll(
                                {cart.basketitem[i].name});
                          }



                          List<String> prices=[];
                          for(int i=0;i< cart.basketitem.length;i++){
                            prices.addAll(
                                {cart.basketitem[i].price.toString()});
                          }

                          List<String>
                          img=[];
                          for(int i=0;i< cart.basketitem.length;i++){
                            img.addAll(
                                {cart.basketitem[i].img});
                          }

                          Map<String,String>data=Map<String,String>();
                          final uri = "https://tpowep.com/storepanal/storepanal/orderss.php";
                          SharedPreferences preferences=await SharedPreferences.getInstance();
                          String username=  preferences.getString("username").toString();

                          for(int i=0;i< id.length;i++){
                            data.addAll({"name[$i]":id[i]});
                          }
                          for(int i=0;i<prices.length;i++){
                            data.addAll({"price[$i]":prices[i]});
                          }
                          data = {
                            "name": id.toString(),
                            "img": img.toString(),
                            "user": username.toString(),
                            "price":prices.toString(),
                          };

                          http.Response response = await http.post(
                            Uri.parse(uri),
                            body:data,
                          );
                          if (response.statusCode == 200) {
  //                          Fluttertoast.showToast(msg:"تم ارسال طلب الشراء");
                          }
                          else {
//                            Fluttertoast.showToast(msg:"Error Occurred",);
                          }

                          }

                        else
                          _showMyDialog(context);
                      },




                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Checkout",
                            style: TextStyle(color: coltes),),
                          Icon(Icons.arrow_forward, color: primary,
                          )
                        ],
                      )

                  )
              );
            }


            ),
          ],
        ),
        body:
        Consumer<cart>(builder: (context,cart,chlid){
          return
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cart.basketitem.length,
                      itemBuilder: (context,i){
                        return Card(
                          child:



                          ListTile(
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        "https://tpowep.com/storepanal/storepanal/" +
                                            cart.basketitem[i].img,
                                        width: 150,
                                        height: 150,
                                      ),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${cart.basketitem[i].name}'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${cart.basketitem[i].price}'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(icon: Icon(Icons.close_rounded),onPressed: (){
                              cart.remove(cart.basketitem[i]);

                            },),
                          ),
                        );
                      }
                  ),
                ),

              ],
            );

        }
        ),

      ),
    );
  }
}


Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('تسجيل دخول'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('الرجاء تسجيل الدخول'),

            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


postingList() async {
  String hireID;
  List<String> id=["1","2","3","4","5"];
  List<String> prices=["600","700","800","900","1000"];
  Map<String,String>data=Map<String,String>();
  final uri = "https://tpowep.com/storepanal/storepanal/orderss.php";
  SharedPreferences preferences=await SharedPreferences.getInstance();
  String username=  preferences.getString("username").toString();


  for(int i=0;i<id.length;i++){
    data.addAll({"name[$i]":id[i]});
  }
  for(int i=0;i<prices.length;i++){
    data.addAll({"price[$i]":prices[i]});
  }
  data = {
    "name": id.toString(),
    "img": "pppp",
    "user": username.toString(),
    "price":prices.toString(),
  };

  http.Response response = await http.post(
    Uri.parse(uri),
    body:data,
  );
  if (response.statusCode == 200) {
   // Fluttertoast.showToast(msg:"Error Occurred",timeInSecForIosWeb:    25);
  }
  else {
    //Fluttertoast.showToast(msg:"Error Occurred",timeInSecForIosWeb:    25);
  }
}
