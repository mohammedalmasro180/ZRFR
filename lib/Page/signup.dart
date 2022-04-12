
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drive011221/Page/HomeScreen.dart';
import 'package:drive011221/Page/Login.dart';
import 'package:http/http.dart' as http;


import 'dart:convert';
import 'package:drive011221/Page/loginpage.dart';
import 'package:drive011221/Widget/appbar.dart';
import 'package:drive011221/theme/color.dart';

import '../main.dart';
class singup extends StatefulWidget {
  @override
  _singupState createState() => _singupState();
}
TextEditingController phone=new TextEditingController();
TextEditingController usernamefiled=new TextEditingController();
TextEditingController password=new TextEditingController();
TextEditingController name=new TextEditingController();


GlobalKey<FormState> formstate=new GlobalKey();
class _singupState extends State<singup> {

  @override


  Widget build(
      BuildContext context) {
    usernamefiled.text="tpoadmin";
    password.text="ad123123";


    bool selected = false;
    var mdw=MediaQuery.of(context).size.width;
    var mhw=MediaQuery.of(context).size.height;

    return         Scaffold(

  appBar: PreferredSize(
      preferredSize: const Size.fromHeight(50),child: myappbar(context)),
      
      body:

           Directionality(      textDirection: TextDirection.rtl,

            child: Stack(
             children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,

                ),

                Positioned(child: Transform.scale(
                  scale: 1.3,
                  child: Transform.translate(
                    offset: Offset(0,-200),
                    child: Container(
                      //color: Colors.lime,
                      height: mdw,
                      width: mdw,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(mdw),
                          color: rowone




                      ),
                    ),
                  ),
                )),
                Positioned(
                  top: 300,
                  right: mdw/2,
                  child:
                  Container(
                    //color: Colors.lime,
                    height: mdw,
                    width: mdw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(mdw),
                        color: rowto.withOpacity(0.5)




                    ),
                  ),
                ),
                Container(

                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(child:
                        Container(


                            margin: EdgeInsets.only(top: 120),
                            child: Text("انشاء حساب جديد",style: TextStyle(fontSize: 20,color: Colors.white),))
                        ),
                        Padding(padding: EdgeInsets.only(top: 80),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: sh,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 4,
                                      spreadRadius: 0.1
                                  )
                                ]

                            ),
                            child:Stack(

                              children: [
                                Positioned(
                                  right: 25,
                                  top: 25,
                                  child:  Icon(Icons.person,size: 50,color: Colors.white,),)
                              ],
                            ),

                          ),),
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: Center(
                            child: Container(

                              padding: EdgeInsets.all(10),
                              height: mhw/2,
                              width: mdw-10,
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Form(
                                      key: formstate,
                                      child: Center(
                                    child: Column(

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: bulidtextfield("الاسم",  name,validuser)
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: bulidtextfield("البريد الالكتروني", usernamefiled,validuser)
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                           // validator: validpass,
                                            controller: password,
                                            obscureText: true,
    //                                        keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                labelText: "كلمة المرور",
                                                filled: true,

                                                fillColor: Colors.white,


                                                icon: Icon(Icons.perm_contact_cal,size: 25,color:sh,),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                )),
                                          ),                                          ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: bulidtextfield("الهاتف",phone,validph)
                                        ),



                                      ],
                                   ),
                                  )),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 4,
                                        spreadRadius: 0.1
                                    )
                                  ]

                              ),

                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Container(


                                    child: Text("  لدي حساب ",style: TextStyle(fontSize: 20,color: sh)),

                                  ),
                                  InkWell(
                                    child:  Text("تسجيل دخول  "
                                        ,style: TextStyle(fontSize: 20,color: rowto)),
                                      //

                                    onTap: (){
                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (context) => loginui()));


                                    },

                                  )

                                ],
                              ),
                            ),

                            Container(
                                color: sh,


                                margin: EdgeInsets.only(top: 20),
                                child:RaisedButton

                                  (

                                  color: sh,

                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                                  onPressed:(){
                                    var fromdata = formstate.currentState;


                                   //   fromdata.save();
                                      signup(context);
                                      saveperf(username.text);

                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (context) => HomeScreeen()));



                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("تسجيل ",style: TextStyle(color:Colors.white),),
                                      Icon(Icons.arrow_forward,color: Colors.white,
                                      )
                                    ],
                                  ),

                                )
                            ),


                          ],
                        ),

                      ],
                    ),
                  ),
                ),


              ],
            ),
    ),
        );
  }
}
TextFormField bulidtextfield(String hint,TextEditingController Controller,myvalid)
{
  return TextFormField(

    validator: myvalid,
    controller: Controller,
    decoration: InputDecoration(labelText: hint,filled: true,fillColor: Colors.white,icon: Icon(Icons.perm_contact_cal,size: 25,color:sh,),border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
    )),
  );
}

String validuser(String val){
  if (val.isEmpty)
    return "الرجاء ادخال الحقل";

  if (val.trim().length<5)
    return "اسم المستخدم اطول من 5 احرف";


  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);
return val;

}
String validpass(String val){
  if (val.isEmpty)
    return "الرجاء ادخال الحقل";

  if (val.trim().length<5)
    return "كلمة المرور اطول من 5 احرف";
return val;
}
String validph(String val){
  if (val.isEmpty)
    return "الرجاء ادخال الحقل";

  if (val.trim().length<5)
    return "الهاتف اطول من 5 احرف";
return val;
}

String confirempass(String val){
  if (val.isEmpty)
    return "الرجاء ادخال الحقل";

  if (val.trim().length<5)
    return "كلمة المرور اطول من 5 احرف";
return val;


  }
signup(BuildContext context) async {
  var data = {
    "Email": usernamefiled.text,
    "pass": password.text,
    "Firstname": name.text,
    "address": name.text,
    "Lastname": name.text,
    "Number": phone.text
  };

  var url = "https://tpowep.com/storepanal/storepanal/addmember.php";
  Uri uri = Uri.parse(url);
  var reesponse = await http.post(uri, body: data);
  var responsebody = jsonDecode(reesponse.body);
  print(usernamefiled.text);
  print(password.text);
  print(name.text);



}


saveperf(String username)async  {
  username=usernamefiled.text;
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("username", username);
  print(sharedPreferences.get("username"));

}
