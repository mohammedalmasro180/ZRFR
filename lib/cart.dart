import 'package:drive011221/model/cart.dart';
import 'package:flutter/material.dart';
class cart with ChangeNotifier{
  List<Item> _list=[];
  double _price=0;
  void add(Item item){
    _list.add(item);
    _price+=item.price;
    notifyListeners();

  }
  void remove(Item item){
    _list.remove(item);
    _price-=item.price;
    notifyListeners();

  }
  int get count{
    return _list.length;
  }
  double get total{
    return _price;
  }
  double get priceee{
    return _price;
  }
  List <Item> get basketitem{
    return _list;

}

}