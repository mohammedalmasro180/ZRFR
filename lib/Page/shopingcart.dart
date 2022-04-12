import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:drive011221/Page/Details.dart';
import 'dart:convert' as convert;

import 'package:drive011221/Widget/appbar.dart';
import 'package:drive011221/Widget/prolist.dart';
class shopingcart extends StatefulWidget {
  final name;
  final price;
  final cat;
  final poss;
  final cam;
  final ram;
  final img;
  shopingcart({this.name,this.cat,this.poss,this.ram,this.price,this.cam,this.img});
  @override
  _shopingcartState createState() => _shopingcartState();
}

class _shopingcartState extends State<shopingcart> {
  @override
  Widget build(BuildContext context) {
    //
    Future getdata() async{
      var url="https://tpowep.com/storepanal/storepanal/order_details.php"
      ;
      var data={"id":widget.cat};
      Uri uri = Uri.parse(url);
      var respomose=await http.post(uri,body: data);
      var respomosebody=convert.jsonDecode(respomose.body);
      return respomosebody;


    }

    return Scaffold(appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),child: myappbar(context)),
        body: FutureBuilder(
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
                                Image.network("https://tpowep.com/storepanal/storepanal/"+
                                    snapshot.data[i]['product_img'],
                                ),
                                ),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mname


                                  children: [


                                    Text(snapshot.data[i]['product_name'],style: TextStyle(fontWeight: FontWeight.w600),),
                                    Text("المواصفات",style: TextStyle(fontWeight: FontWeight.w600),),


                                    Row(

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [


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
                                              Text("السعر"),
                                              Text(snapshot.data[i]['price']

                                                  +"\$",style: TextStyle(color: Colors.deepOrange)),
                                            ],
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [

                                              Text("الكمية"),
                                              Text(snapshot.data[i]['quantity'],style: TextStyle(color: Colors.deepOrange)),
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
                              name: snapshot.data[i]['name'],
                              description: snapshot.data[i]['description'],
                              price: snapshot.data[i]['price'],
                              img: snapshot.data[i]['location'],
                              quantity: snapshot.data[i]['quantity'],
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
