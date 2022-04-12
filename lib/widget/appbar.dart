import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:drive011221/Page/Details.dart';
import 'package:drive011221/basketitem.dart';
import 'package:drive011221/cart.dart';
import 'dart:convert' as convert;

import 'package:drive011221/theme/color.dart';

Widget myappbar(context){
  return   AppBar(title: Text('data'),
    backgroundColor: primary,
    actions: [
      Row(
        children: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return basket();
            }));
          }),
          Consumer<cart>(builder: (context,cart,chlid){
            return Text('${cart.count}');
          })
        ],
      )
    ],

  );
}

class TheSearch extends SearchDelegate<String> {
  //TheSearch({this.contextPage,});

  late BuildContext contextPage;
  //WebViewController controller;
  @override
  String get searchFieldLabel => "Enter a web address";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
    //    close(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder:(BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(

                itemCount: snapshot.data.length,

                itemBuilder: (context,i) {

                  return InkWell(
                    child: Container(
                      height: 250,

                      width: 150,
                      child: Card(
                        child: Row(
                          children: [
                            Expanded(child:
                            Image.network("https://tpowep.com/mob/admin/images/"+snapshot.data[i]['iname'],)),
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
                                          Text(snapshot.data[i]['ram']+"G",style: TextStyle(color: Colors.deepOrange)),
                                        ],
                                      ),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [

                                          Text("السعر"),
                                          Text(snapshot.data[i]['price']+"\$",style: TextStyle(color: Colors.deepOrange)),
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
                                          Text(snapshot.data[i]['pross'],style: TextStyle(color: Colors.deepOrange)),
                                        ],
                                      ),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [

                                          Text("الكاميرا"),
                                          Text(snapshot.data[i]['camera'],style: TextStyle(color: Colors.deepOrange)),
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
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Details(

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

  Future getdata() async{
    var url="https://tpowep.com/mob/search.php";
    var data={"serach":query};
    Uri uri = Uri.parse(url);
    var respomose=await http.post(uri,body: data);
    var respomosebody=convert.jsonDecode(respomose.body);
    return respomosebody;


  }
  @override
  Widget buildSuggestions(BuildContext context) {
    //final suggestions = query.isEmpty ? suggestions1 : [];
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (content, index) => ListTile(
        onTap: (){
          query=query;
          showResults(context);
        },
          leading: Icon(Icons.arrow_left), title: Text(query)),
    );
  }
}

Future getdata() async{
  var url="https://tpowep.com/mob/api.php";
  Uri uri = Uri.parse(url);
  var respomose=await http.get(uri);
  var respomosebody=convert.jsonDecode(respomose.body);
  return respomosebody;


}

