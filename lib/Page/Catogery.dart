import 'package:flutter/material.dart';
import 'package:drive011221/Page/tras.dart';
import 'package:drive011221/Widget/appbar.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import 'package:drive011221/Widget/drawer.dart';
class Catogery extends StatefulWidget {
  @override
  _CatogeryState createState() => _CatogeryState();
}

class _CatogeryState extends State<Catogery> {
  @override
  //
  Future getdata() async{
    var url="https://tpowep.com/storepanal/storepanal/cat/catpro.php";
    Uri uri = Uri.parse(url);
    var respomose=await http.get(uri);
    var respomosebody=convert.jsonDecode(respomose.body);
    return respomosebody;


  }

 Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),child: myappbar(context)),

        drawer: drawer(),
      body:FutureBuilder(
          future: getdata(),
          builder:(BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: snapshot.data.length,

                  itemBuilder: (context,i) {

                    return
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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




      )
    );

  }
}
