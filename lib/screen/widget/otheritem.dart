import 'package:flutter/material.dart';

class Otheritem extends StatelessWidget {
  final String menu;
  final String listmenu;
  const Otheritem({super.key,required this.menu, required this.listmenu});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 100,
            maxWidth: 100
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(child: Icon(Icons.food_bank)),
                ),
              ),
              Text(menu,maxLines: 1,),
              Text(listmenu,maxLines: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
