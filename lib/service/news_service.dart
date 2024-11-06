import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/model/news_model.dart';

class newservice{

  static Dio dio= Dio();

  static Future<newmodel> futcdata() async{
    Response response= await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=a410b1724f84452c8df8a810efe34642');
    return newmodel.fromjson(response.data);
  }
}