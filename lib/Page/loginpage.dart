import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drive011221/Page/Catogery.dart';
import 'package:drive011221/Page/HomeScreen.dart';
//import 'package:drive011221/Page/loginn.dart';
import 'package:drive011221/Page/signup.dart';
import 'package:drive011221/Widget/appbar.dart';
import 'package:drive011221/theme/color.dart';
class loginui extends StatefulWidget {
  @override
  _loginuiState createState() => _loginuiState();
}

class _loginuiState extends State<loginui> {
  GlobalKey<FormState> formstate=new GlobalKey();
  bool selected = false;
  TextEditingController phone = new TextEditingController ();
  TextEditingController username = new TextEditingController ();
  TextEditingController passwordd = new TextEditingController ();
  TextEditingController name= new TextEditingController();
  bool liading=false;
  String validuser(String val) {
    if (val.isEmpty)
      return "الرجاء ادخال الحقل";


    if (val
        .trim()
        .length < 5)
      return "اسم المستخدم اطول من 5 احرف";
    return val;
  }

  String validpass(String val) {
    if (val.isEmpty)
      return "الرجاء ادخال الحقل";

    if (val
        .trim()
        .length < 5)
      return "كلمة المرور اطول من 5 احرف";
    return val;
  }

  String confirempass(String val) {
    if (val.isEmpty)
      return "الرجاء ادخال الحقل";

    if (val.trim()
        .length < 5)
      return "كلمة المرور اطول من 5 احرف";
    return val;
  }

  // For CircularProgressIndicator.
  bool visible = false ;

  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  logiwn() async {
    var response;
    var result;
    var fromdata = formstate.currentState;



    fromdata!.save();
    var data = {"username": username.text, "password": passwordd.text};
    var url = "https://tpowep.com/storepanal/storepanal/loginmhd.php";
    Uri uri = Uri.parse(url);
    var reesponse = await http.post(uri, body: data);
    result = jsonDecode(reesponse.body);
    //ed=responsebody;
    print(result);

    if (result=="Login") {

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreeen()));
      setState(() {

        saveperf(username.text);
      });
      liading=true;




    }
    else {
      msg(context);
      liading=false;
    }
    print(liading);

  }




  @override
  Widget build(BuildContext context) {
     username.text="tpoadmin";
     passwordd.text="ad123123";

    var mdw=MediaQuery.of(context).size.width;

    return        Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),child: myappbar(context)),
      body:  Directionality(      textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,

            ),
            Positioned(child: Transform.scale(
              scale: 1.3,
              child: Transform.translate(

                offset: Offset(0,-100),
                child: Container(
                  //color: Colors.lime,
                  height: mdw,
                  width: mdw,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(mdw),
                      color: sh




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
                    color: sh.withOpacity(0.5)




                ),
              ),
            ),
            Container(
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    Center(child:
                    Container(


                        margin: EdgeInsets.only(top: 120),
                        child: Text("تسجيل الدخول",style: TextStyle(fontSize: 20,color: Colors.white),))
                    ),
                    Padding(padding: EdgeInsets.only(top: 80),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber,
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
                    ElasticInRight(
                      delay: Duration(
                          milliseconds: 700
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
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

                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Form(
                                      key: formstate,
                                      child: Center(
                                        child: Column(

                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                //               autovalidate: true,
                                                controller: username,
                     //                           validator: validuser,
                                                decoration: InputDecoration(labelText: "الاسم",filled: true,fillColor: Colors.white,icon: Icon(Icons.perm_contact_cal,size: 25,color:sh,),border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                )),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                controller: passwordd,
                                                //                      validator: validpass,
                                                obscureText: true,

                                                decoration: InputDecoration(
                                                    labelText: "كلمة المرور",
                                                    filled: true,


                                                    fillColor: Colors.white,


                                                    icon: Icon(Icons.perm_contact_cal,size: 25,color:sh,),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(20)
                                                    )),
                                              ),
                                            ),


                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(


                            margin: EdgeInsets.only(top: 20),
                            child: Text("هل نسيت كلمة المرور؟",style: TextStyle(fontSize: 20,color: sh),)
                        ),
                        Container(



                            margin: EdgeInsets.only(top: 20),
                            child:RaisedButton(
                              color: rowto,
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                              onPressed:() {
                                var fromdata = formstate.currentState;
                                if (fromdata!.validate()) {
                                  fromdata.save();
                                  logiwn();



                                }

                              },

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("تسجيل الدخول",style: TextStyle(color:Colors.white),),
                                  Icon(Icons.arrow_forward,color: Colors.white,
                                  )
                                ],
                              ),
                            )
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Container(


                                child: Text("  ليس لدي حساب انشاء",style: TextStyle(fontSize: 20,color: sh)),

                              ),
                              InkWell(
                                child:  Text("حساب جديد  "
                                    ,style: TextStyle(fontSize: 20,color: rowto)),

                                onTap: (){
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) =>singup()));

                                },

                              )

                            ],
                          ),

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
saveperf(String username)async  {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  sharedPreferences.setString("username", username);
  print(sharedPreferences.get("username"));

}
Future<void> msg(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Icon(Icons.error,color: Colors.red,),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('خطأ في تسجيل الدخول'),

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
