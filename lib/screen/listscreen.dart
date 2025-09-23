import 'package:flutter/material.dart';
import 'package:fundamental_submission1/provider/listScreenProvider.dart';
import 'package:fundamental_submission1/screen/widget/Carditem.dart';
import 'package:fundamental_submission1/static/status.dart';
import 'package:provider/provider.dart';

class Listscreen extends StatefulWidget {
  const Listscreen({super.key});

  @override
  State<Listscreen> createState() => _ListscreenState();
}

class _ListscreenState extends State<Listscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<Listscreenprovider>().fetchresto());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Consumer<Listscreenprovider>(
        builder: (context, vlaue, child) {
          switch (vlaue.status) {
            
            case ListRestoranLoading():
              // TODO: Handle this case.
              return Center(child: const CircularProgressIndicator());
            case ListRestoranError(message: var message):
              return Center(child: Text("ada yang error $message"));
      
            case ListRestoranSukses(data: var data):
              // TODO: Handle this case.
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: false,
                    floating: true,
                    expandedHeight: 100,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.only(left: 16, bottom: 22),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min, // biar wrap content
                        children: [
                          Text(
                            "Restaurant",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Tempat makan favoritmu",
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: data.restoran.length,
                    itemBuilder: (context, index) => CardItem(datalist: data.restoran[index],),
                  ),
                ],
              );
            default:
              // TODO: Handle this case.
              return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
