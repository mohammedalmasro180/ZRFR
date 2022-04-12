import 'package:drive011221/basketitem.dart';
import 'package:drive011221/cart.dart';
import "package:flutter/material.dart";
import 'package:drive011221/model/cart.dart';
import 'package:provider/provider.dart';


class MyAppP extends StatefulWidget {


  @override
  _MyAppPState createState() => _MyAppPState();
}

class _MyAppPState extends State<MyAppP> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> cart(),





      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'mhd',
        home: Home(),
      ),

    );
  }
}
class Home extends StatefulWidget {



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Item>item=[
      Item(name: 'mhd',price:100,img:'ppp0',id: 1),
      Item(name: 'mhd',price:100,img:'ppp0',id: 1),
      Item(name: 'mhd',price:100,img:'ppp0',id: 1),


    ];

    return Scaffold(
      appBar: AppBar(title: Text('data'),
        actions: [
          Row(
            children: [
              IconButton(icon: Icon(Icons.shopping_basket_sharp), onPressed: (){
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

      ),
      body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context,i){
            return Card(
                child:
                Consumer<cart>(builder: (context,cart,chlid){
                  return

                    ListTile(
                      title: Text('${item[i].name}'),
                      trailing: IconButton(icon: Icon(Icons.add),onPressed: (){
                        cart.add(item[i]);
                      },),
                    );
                })
            );

          }),
    );
  }
}
