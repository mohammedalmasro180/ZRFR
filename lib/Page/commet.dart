import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drive011221/theme/color.dart';
late bool sgin;
class comment extends StatefulWidget {
  @override
  final  id;
  comment({this.id});

  _commentState createState() => _commentState();
}
//https://tpowep.com/storepanal/storepanal/commnets.php
TextEditingController textEditingController = new TextEditingController ();
Future getdata(String id) async{
  var url="https://tpowep.com/storepanal/storepanal/commnets.php?id=$id";
  var data={"id":id};
  Uri uri = Uri.parse(url);
  var respomose=await http.post(uri,body: data);
  var respomosebody=convert.jsonDecode(respomose.body);
  return respomosebody;


}


class _commentState extends State<comment> {
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: new Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Align(

              alignment: FractionalOffset.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: FutureBuilder(
                    future: getdata(widget.id),
                    builder:(BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(

                            itemCount: snapshot.data.length,

                            itemBuilder: (context,i) {


                              return  Row(
                                children: [
                                  Expanded(
                                    child: Padding(padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.perm_contact_cal),),
                                  ),
                                  SizedBox(height: 25,),
                                  Expanded(
                                    child: Padding(padding: EdgeInsets.all(8.0),
                                      child: Text(snapshot.data[i]['name'] ),),
                                  ),
                                  Padding(padding: EdgeInsets.all(8.0),
                                      child:Container(
                                          width: mdw/2,
                                          height: 60,
//                        color: Colors.amber,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color:rowone,
                                              boxShadow: [
                                                BoxShadow(

                                                )
                                              ]

                                          ),

                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(snapshot.data[i]['text'] ),
                                          )))

                                ],
                              );
                            });
                      }
                      else
                        return CircularProgressIndicator();

                    }
                )
              ),

                       )),
            Expanded(child:Align(
              alignment: FractionalOffset.bottomCenter,
              child:  TextField(
                controller: textEditingController,
                decoration: new InputDecoration(
                  //fillColor: Colors.amber,
                  hintText: 'Type something',
                ),
              ),
            )),


            new RaisedButton(
              onPressed: () {
                addpost(widget.id);

              },
              child: new Text('تعليق'),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField bulidtextfield(String hint,TextEditingController Controller)
  {
    return TextFormField(
      minLines: 1,
      maxLines: 10,

      maxLength: 255,



      controller: Controller,
      decoration: InputDecoration(labelText: hint,filled: true,fillColor: Colors.white,icon: Icon(Icons.perm_contact_cal,size: 25,color:sh,),border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
      )),
    );
  }

}

addpost(String post) async {
  //BulidContext context;
  SharedPreferences preferences=await SharedPreferences.getInstance();
  String username=  preferences.getString("username").toString();
  print(textEditingController.text);
    var data = {
      "name": username,
      "text": textEditingController.text,
      "postid":post
    };

    var url = "https://tpowep.com/storepanal/storepanal/addcommet.php";
  Uri uri = Uri.parse(url);
    var reesponse = await http.post(uri, body: data);
    var responsebody = jsonDecode(reesponse.body);
    print(responsebody);
  }
