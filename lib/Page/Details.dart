import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import 'package:drive011221/Widget/appbar.dart';
import 'package:drive011221/Widget/drawer.dart';
import 'package:drive011221/cart.dart';
import 'package:drive011221/model/cart.dart';
import 'package:drive011221/theme/color.dart';
class Details extends StatefulWidget {
  final name;
  final price;
  final description;
  final  quantity;
  final img;
  Details({this.name,this.description,this.quantity,this.price,this.img});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Directionality(      textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),child: myappbar(context)),
          drawer: drawer(),
          body: ListView(
            children: [
              Container(
                height: 300,
                child: GridTile(
                  child:Image.network("https://tpowep.com/storepanal/storepanal/"+widget.img,),
                  footer: Container(
                    height: 50,
                    alignment: Alignment.center,
                    color:sh,
                    child: Row(
                      children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.name.toString(),style: TextStyle(fontSize: 20,color: coltes),),
                        )),

                        Directionality(      textDirection: TextDirection.ltr,
                            child: Expanded(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.price.toString()+"\$",style: TextStyle(fontSize: 20,color: coltes),),
                            ))),

                      ],
                    ),

                  ),
                ),
              ),
              Container(
                child: Text("المواصفات",style: TextStyle(fontSize: 20),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),

                          color:rowone,
                          child:
                          RichText(
                            text: TextSpan(


                              children: <TextSpan>[

                                TextSpan(text:widget.description,style: TextStyle(fontSize: 20,color: coltes),),
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),

                          color:rowone,
                          child:
                          RichText(
                            text: TextSpan(


                              children: <TextSpan>[
                                TextSpan(text:"الكمية  ",style: TextStyle(fontSize: 20,color: coltes),),
                                TextSpan(text:widget.quantity,style: TextStyle(fontSize: 20,color: coltes),),
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
                          color:rowone,
                          child:
                          RichText(
                            text: TextSpan(


                              children: <TextSpan>[
                                TextSpan(text:" الجودة",style: TextStyle(fontSize: 20,color: coltes),),
                                TextSpan(text:" "+widget.quantity,style: TextStyle(fontSize: 20,color: coltes),),
                              ],
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(10),
    child:  Consumer<cart>(builder: (context,cart,chlid){

      List<Item>item=[
        Item(name: widget.name,price:double.parse(widget.price), img: widget.img,id: 1)];
    return
      RaisedButton (
          color: sh,

          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
          onPressed: (

              )  async {
            cart.add(item[0]);

  /*          Fluttertoast.showToast(msg:"تم ارسال طلب الشراء",

                toastLength: Toast.LENGTH_SHORT,
                //gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,

                backgroundColor: sh,
                textColor: coltes,
                fontSize: 16.0);
   */       },

          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("اضافة الى السلة",
                style: TextStyle(color: coltes),),
              Icon(
                Icons.shopping_cart, color: coltes,
              )
            ],
          )

      );

    }
    ),




                      ),
                    ),



                  ],
                ),
              )


            ],
          ),

        )
    );
  }

  bay() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String username=  preferences.getString("username").toString();

    var data = {
      "name": widget.name,
      "img":widget.img,
      "user": username,
      "price": widget.price,
    };
    var url = "https://tpowep.com/storepanal/storepanal/orderss.php";
    Uri uri = Uri.parse(url);
    var reesponse = await http.post(uri, body: data);
    var responsebody = jsonDecode(reesponse.body);

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
Future<void> _addcart(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('تمت اضافة الى السلة'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('تمت اضافة الى السلة'),

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

_showToast() {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("This is a Custom Toast"),
      ],
    ),
  );
}