import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:drive011221/Page/Details.dart';

import 'package:animate_do/animate_do.dart';
import 'package:drive011221/Page/tras.dart';
import 'package:drive011221/Widget/appbar.dart';
import 'package:http/http.dart' as http;
import 'package:drive011221/cart.dart';
import 'package:drive011221/model/cart.dart';

import 'dart:convert' as convert;

import 'package:drive011221/theme/color.dart';

class homepro extends StatefulWidget {
  @override
  _homeproState createState() => _homeproState();
}

class _homeproState extends State<homepro> {

  Future getdata() async {
    var url = "https://tpowep.com/storepanal/storepanal/productt.php";
    Uri uri = Uri.parse(url);
    var respomose = await http.get(uri);
    var respomosebody = convert.jsonDecode(respomose.body);
    return respomosebody;
  }
    @override




  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder:(BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(

                itemCount: snapshot.data.length,

                itemBuilder: (context,i) {
                  List<Item>item=[
                    Item(name: snapshot.data[i]['name'],price: double.parse('${snapshot.data[i]['price'] }'), img: snapshot.data[i]['location'],id: 1)];

                  return

                    Consumer<cart>(builder: (context,cart,chlid)
                    {
                      return

                        InkWell(
                          child: ElasticInRight(
                            delay: Duration(
                                milliseconds: 700
                            ),

                            child: Card(
                              child: ListTile(
                                title: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            "https://tpowep.com/storepanal/storepanal/" +
                                                snapshot.data[i]['location'],
                                            width: 150,
                                            height: 150,

                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            snapshot.data[i]['name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            snapshot.data[i]['price']+"\$",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: IconButton(icon: Icon(Icons.shopping_cart,size: 35,color: coltes,),
                                  onPressed: (){

                                  List<Item>item=[
                                    Item(name:
                                    snapshot.data[i]['name'],price:double.parse(snapshot.data[i]['price'],), img:  snapshot.data[i]['location'],id: 1)];
                                  cart.add(item[0]);

                                },),

                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return Details(
                                    name: snapshot.data[i]['name'],
                                    description: snapshot
                                        .data[i]['description'],
                                    price: snapshot.data[i]['price'],
                                    img: snapshot.data[i]['location'],
                                    quantity: snapshot.data[i]['quantity'],
                                  );
                                }));
                          },
                        );
                    }
                    );
                });
          }
          else
            return CircularProgressIndicator();

        }
    );
  }
}
