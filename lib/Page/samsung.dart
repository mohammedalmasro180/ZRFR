
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:drive011221/Widget/appbar.dart';
import 'package:drive011221/Widget/drawer.dart';
Future getdata() async{
  var url="https://tpowep.com/mob/api.php";
  Uri uri = Uri.parse(url);
  var respomose=await http.get(uri);
  var respomosebody=convert.jsonDecode(respomose.body);
  return respomosebody;


}

class ProductsL extends StatefulWidget {
  @override
  _ProductsLState createState() => _ProductsLState();
}
class _ProductsLState extends State<ProductsL> {
  @override
  Widget build(BuildContext context) {
    return Directionality(      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),child: myappbar(context)),
          body: FutureBuilder(
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
          )
      ),
    );
  }
}
