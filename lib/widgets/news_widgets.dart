import 'package:flutter/material.dart';
class newswidget extends StatelessWidget {
  String img,title,desc;

  newswidget({
   required this.title,
   required this.desc,
   required this.img
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Card(
        color:Colors.lightBlueAccent,
        child:Column(
          children: [
            CircleAvatar(
             backgroundImage:NetworkImage(img),
            ),
            Text(title),
            Text(desc)
          ],
        ),
      ),
    );
  }
}
