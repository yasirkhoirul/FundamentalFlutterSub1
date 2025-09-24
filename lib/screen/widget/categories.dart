import 'package:flutter/material.dart';

import 'package:fundamental_submission1/api/model/restoran.dart';

class Categoriessss extends StatelessWidget {
  final Categories kategori;
  const Categoriessss({super.key, required this.kategori});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.all(5), child: Text(kategori.name)),
    );
  }
}
