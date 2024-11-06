import 'package:flutter/cupertino.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/news_service.dart';

class newprovider extends ChangeNotifier{
  newmodel?newmod;

  Future<void> provdata() async{
    newmod= await newservice.futcdata();
    notifyListeners();
  }
}