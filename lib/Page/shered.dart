import 'package:drive011221/Page/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:drive011221/Widget/appbar.dart';
class shared extends StatefulWidget {
  @override
  _sharedState createState() => _sharedState();
}
var country;
class _sharedState extends State<shared> {
  saveperf(String cu)async  {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("key", cu);
    print(sharedPreferences.get("key"));
    if (cu != null)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreeen()));

  }

  getperf(String cu)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    country = sharedPreferences.getString("key");
    print(country);


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),child: myappbar(context)),
        body:ListView(
        children: [
          ListTile(
            title: Text("سوريا"),
            trailing:                           Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Flag_of_Syria_%281932%E2%80%931958%2C_1961%E2%80%931963%29.svg/280px-Flag_of_Syria_%281932%E2%80%931958%2C_1961%E2%80%931963%29.svg.png",width: 55,height: 55,),
            onTap: (){

              saveperf("sy");
            },
          ),
          ListTile(
            title: Text( "السعودية"),


            trailing: Image.network("https://www.marefa.org/images/thumb/0/0d/Flag_of_Saudi_Arabia.svg/1200px-Flag_of_Saudi_Arabia.svg.png",width: 55,height: 55,),
            onTap: (){
              saveperf("SAR");

            },
          ),
          ListTile(
            title: Text("تركيا"),
            trailing: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/280px-Flag_of_Turkey.svg.png",width: 55,height: 55,),
            onTap: (){


              saveperf("TAR");
            },
          )
        ],
      )
    );
  }
}
