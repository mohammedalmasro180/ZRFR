import 'package:drive011221/Page/commet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:drive011221/Widget/appbar.dart';
import 'package:drive011221/Widget/drawer.dart';
import 'package:drive011221/Widget/posts.dart';
import 'package:drive011221/theme/color.dart';
import 'dart:convert' as convert;
class posts extends StatefulWidget {
  @override
  _postsState createState() => _postsState();
}
bool sign=true;
TextEditingController textEditingController = new TextEditingController ();

class _postsState extends State<posts> {


  Future getdata() async{
    var url="https://tpowep.com/storepanal/storepanal/post.php";
    Uri uri = Uri.parse(url);

    var respomose=await http.get(uri);
    var respomosebody=convert.jsonDecode(respomose.body);
    return respomosebody;


  }

  var username="user";
  getperf() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    username=   preferences.getString("username").toString();
    if(username!= null){
      setState(() {
        username=   preferences.getString("username").toString();
        sign=true;
        print(username);
      });
    }


  }
  void initState() {

    // TODO: implement initState
    getperf();
  }


  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width-250;
    var mhw=MediaQuery.of(context).size.height;
    return Scaffold(
   //   appBar: myappbar(context),
      drawer: drawer(),
      body: Container(
        child: Directionality(
          textDirection: TextDirection.rtl,

          child:ListView(
            children: [
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: bulidtextfield("تعليق", textEditingController)

                    ),
                    Row(
                      children: [
                        Expanded(child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              addpost();


                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.comment),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("اضف تعليق",textAlign: TextAlign.center,),
                                ),
                                SizedBox(),

                              ],
                            ),
                          ),
                        )),

                      ],
                    )

                  ],
                ),

              ),
             SizedBox(height: 22,),


              Row(
                children: [
                  SingleChildScrollView(
                    child: Container(
                        height: mhw,
                        width: 558,
                        child: postslist()),
                  ),
                ],
              )            ],

          ) ,

        ),
      ),
    );

  }
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

addpost() async {
  //BulidContext context;
  SharedPreferences preferences=await SharedPreferences.getInstance();
  String username=  preferences.getString("username").toString();
  print(textEditingController.text);
  if (sign) {
    var data = {
      "name": username,
      "text": textEditingController.text,
    };

    var url = "https://tpowep.com/storepanal/storepanal/addpost.php";
    Uri uri = Uri.parse(url);
    var reesponse = await http.post(uri, body: data);
    var responsebody = jsonDecode(reesponse.body);
    print(responsebody);
  }
  else
  {

  }
}

