import 'package:flutter/material.dart';
import 'package:fundamental_submission1/provider/list_screen_provider.dart';
import 'package:fundamental_submission1/screen/widget/card_item.dart';
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
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<Listscreenprovider>().fetchresto();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color colorIndicator = Theme.of(context).colorScheme.onPrimary;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Consumer<Listscreenprovider>(
        builder: (context, vlaue, child) {
          switch (vlaue.status) {
            case ListRestoranLoading():
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorIndicator),
                ),
              );
            case ListRestoranError(message: var message):
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<Listscreenprovider>().fetchresto();
                      },
                      child: const Text("Muat Ulang"),
                    ),
                  ],
                ),
              );

            case ListRestoranSukses(data: var data):
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
                    itemBuilder: (context, index) =>
                        CardItem(datalist: data.restoran[index]),
                  ),
                ],
              );
            default:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(colorIndicator),
                ),
              );
          }
        },
      ),
    );
  }
}
