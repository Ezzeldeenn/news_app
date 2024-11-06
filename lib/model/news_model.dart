import 'dart:ffi';

class newmodel{
  List<dynamic> task;
  int total=0;
  newmodel({
    required this.task,
    required this.total,
});

  factory newmodel.fromjson(Map<String,dynamic>json){
    return newmodel(task: json["articles"],total: json["totalResults"]);
  }
}