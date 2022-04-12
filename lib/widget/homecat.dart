import 'package:flutter/material.dart';
import 'package:drive011221/Page/tras.dart';
import 'package:drive011221/Widget/appbar.dart';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';
import 'dart:convert' as convert;

import 'package:drive011221/Widget/drawer.dart';

class homecat extends StatefulWidget {
  @override
  _homecatState createState() => _homecatState();
}

class _homecatState extends State<homecat> {
  Future getdata() async{
    var url="https://tpowep.com/storepanal/storepanal/cat/catpro.php";
    Uri uri = Uri.parse(url);
    var respomose=await http.get(uri);
    var respomosebody=convert.jsonDecode(respomose.body);
    return respomosebody;


  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder:(BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: snapshot.data.length,


                itemBuilder: (context,i) {

                  return
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ZoomIn(
                          delay: Duration(
                              milliseconds: 100
                          ),

                          child: Container(
                            width: 100,
                            height: 100,
                            child: Card(
                              child: Column(
                                children: [
                                  Expanded(child:
                                  Image.network("https://tpowep.com/storepanal/storepanal/"+snapshot.data[i]['img'],)
                                  ),

                                  Text(snapshot.data[i]['text'])

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return sent(
                            cat:snapshot.data[i]['id'],
                          );
                        }));
                      },
                    );


                });
          }
          else
            return CircularProgressIndicator();

        }




    );
  }
}
