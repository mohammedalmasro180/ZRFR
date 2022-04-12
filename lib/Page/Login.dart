import 'package:flutter/material.dart';
import 'package:drive011221/Widget/appbar.dart';
import 'package:drive011221/Widget/drawer.dart';
import 'package:drive011221/theme/color.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),child: myappbar(context)),
        drawer: drawer(),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(25),
            children: [
              Center(
                child: Form(child: Center(
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "الاسم",filled: true,fillColor: Colors.white,icon: Icon(Icons.perm_contact_cal,size: 25,color:sh,),border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.number,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
