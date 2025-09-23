import 'package:flutter/material.dart';
import 'package:fundamental_submission1/api/model/resotoran.dart';

class Reviews extends StatelessWidget{
  final Review data;
  const Reviews({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(Icons.person),
      title: Row(children: [Text(data.name),SizedBox(width: 5,),Text(data.date,style: TextStyle(fontWeight: FontWeight.w200),)]),
      subtitle: Text(data.review,maxLines: 2,overflow: TextOverflow.fade,),
    );
  }
}