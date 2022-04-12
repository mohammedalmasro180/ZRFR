import 'package:flutter/material.dart';
import 'package:drive011221/Page/Details.dart';
import 'package:drive011221/Widget/appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class pro extends StatefulWidget {
  final int id;





  const pro({ required this.id}) ;

  @override
  _proState createState() => _proState();
}

class _proState extends State<pro> {
  Future getdata() async{
    var url="https://tpowep.com/mob/catpro.php?id=Nokia";
    Uri uri = Uri.parse(url);
    var respomose=await http.get(uri);
    var respomosebody=convert.jsonDecode(respomose.body);
    return respomosebody;


  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    //    appBar: myappbar(context),
        body: FutureBuilder(
            future: getdata(),
            builder:(BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(

                    itemCount: snapshot.data.length,

                    itemBuilder: (context,i) {


                      return Column(
                        children: [
                          Container(
                            height:300,

                            child: GridTile(
                              child: Image.network("https://tpowep.com/mob/admin/images/"+snapshot.data[i]['iname'],),
                              footer: Container(
                                height: 50,
                                alignment: Alignment.center,
                                color: Colors.black.withOpacity(0.3),
                                child: Row(
                                  children: [
                                    Expanded(child: Text(snapshot.data[i]['mname'],style: TextStyle(fontSize: 20,color: Colors.white),)),
                                    Directionality(      textDirection: TextDirection.ltr,
                                        child: Expanded(child: Text(snapshot.data[i]['price']                 +"\$",style: TextStyle(fontSize: 20,color: Colors.white),))),

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
                                      color:Colors.deepOrange,
                                      child:
                                      RichText(
                                        text: TextSpan(


                                          children: <TextSpan>[
                                            TextSpan(text:"الذاكرة",style: TextStyle(fontSize: 15,color: Colors.black),),
                                            TextSpan(text:snapshot.data[i]['ram'],style: TextStyle(fontSize: 15,color: Colors.amberAccent),),
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
                                      color:Colors.amber,
                                      child:
                                      RichText(
                                        text: TextSpan(


                                          children: <TextSpan>[
                                            TextSpan(text:"الكاميرا",style: TextStyle(fontSize: 15,color: Colors.black),),
                                            TextSpan(text:snapshot.data[i]['camera'],style: TextStyle(fontSize: 15,color: Colors.deepOrange),),
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
                                      color:Colors.deepOrange,
                                      child:
                                      RichText(
                                        text: TextSpan(


                                          children: <TextSpan>[
                                            TextSpan(text:"الموديل",style: TextStyle(fontSize: 15,color: Colors.black),),
                                            TextSpan(text:"  PRO22",style: TextStyle(fontSize: 15,color: Colors.amberAccent),),
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
                                      color:Colors.amber,
                                      child:
                                      RichText(
                                        text: TextSpan(


                                          children: <TextSpan>[
                                            TextSpan(text:"الموديل",style: TextStyle(fontSize: 15,color: Colors.black),),
                                            TextSpan(text:"  PRO22",style: TextStyle(fontSize: 15,color: Colors.deepOrange),),
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
                                      color:Colors.deepOrange,
                                      child:
                                      RichText(
                                        text: TextSpan(


                                          children: <TextSpan>[
                                            TextSpan(text:"الموديل",style: TextStyle(fontSize: 15,color: Colors.black),),
                                            TextSpan(text:"  PRO22",style: TextStyle(fontSize: 15,color: Colors.amberAccent),),
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
                                      color:Colors.amber,
                                      child:
                                      RichText(
                                        text: TextSpan(


                                          children: <TextSpan>[
                                            TextSpan(text:"الموديل",style: TextStyle(fontSize: 15,color: Colors.black),),
                                            TextSpan(text:"  PRO22",style: TextStyle(fontSize: 15,color: Colors.deepOrange),),
                                          ],
                                        ),
                                      )
                                  ),
                                ),


                              ],
                            ),
                          )


                        ],
                      )
                      ;
                    });
              }
              else
                return CircularProgressIndicator();

            }
        )
    );
  }
}
