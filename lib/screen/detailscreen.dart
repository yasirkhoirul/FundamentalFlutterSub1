import 'package:flutter/material.dart';
import 'package:fundamental_submission1/provider/detailScreenProvider.dart';
import 'package:fundamental_submission1/screen/widget/categories.dart';
import 'package:fundamental_submission1/screen/widget/otheritem.dart';
import 'package:fundamental_submission1/screen/widget/review.dart';
import 'package:fundamental_submission1/static/status.dart';
import 'package:fundamental_submission1/utils/sliverheaderdelegate.dart';
import 'package:provider/provider.dart';

class Detailscreen extends StatefulWidget {
  final String idRestoran;
  const Detailscreen({super.key, required this.idRestoran});
  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(
      () => context.read<Detailscreenprovider>().fetchdataDetail(
        widget.idRestoran,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Consumer<Detailscreenprovider>(
        builder: (context, value, child) {
          switch (value.status) {
            case ListRestoranLoading():
              return SafeArea(
                child: Center(child: CircularProgressIndicator()),
              );

            case ListRestoranError(message: var message):
              return SafeArea(child: Center(child: Text(message)));

            case ListRestoranSuksesDetail(data: var data):
              return SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 200,
                      flexibleSpace: FlexibleSpaceBar(
                        background: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Hero(
                            tag: "restoImage",
                            child: Image.network(
                              "https://restaurant-api.dicoding.dev/images/small/${data.restoran.pictureId}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: Headerdelegate(
                        maxHeight: 120,
                        minHeight: 90,

                        anak: Container(
                          color: Theme.of(context).colorScheme.primary,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.restoran.name,
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on),
                                    Text(
                                      data.restoran.city,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Theme.of(context).colorScheme.onPrimary,
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Rating : ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.star),
                                SizedBox(width: 10),
                                Text(
                                  data.restoran.rating.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.restoran.categories.length,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Categoriessss(
                                      kategori: data.restoran.categories[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(data.restoran.description),
                            const SizedBox(height: 10),
                            const Text(
                              "Food",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Itemmenu(
                              builder: (BuildContext context, int index) {
                                return Otheritem(
                                  menu: "Food",
                                  listmenu: data.restoran.menu.food[index].name,
                                );
                              },
                              panjang: data.restoran.menu.food.length,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Drink",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Itemmenu(
                              builder: (BuildContext context, int index) {
                                return Otheritem(
                                  menu: "Drink",
                                  listmenu:
                                      data.restoran.menu.drink[index].name,
                                );
                              },
                              panjang: data.restoran.menu.drink.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: Headerdelegate(
                        maxHeight: 60,
                        minHeight: 32,
                        anak: Container(
                          padding: EdgeInsets.only(left: 5),
                          child: const Text(
                            "Review",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverList.builder(
                      itemBuilder: (context, index) => Reviews(data:data.restoran.review[index]),
                      itemCount: data.restoran.review.length,
                    ),
                  ],
                ),
              );
            default:
              return SafeArea(child: Text("idle"));
          }
        },
      ),
    );
  }
}

class Itemmenu extends StatelessWidget {
  final NullableIndexedWidgetBuilder builder;
  final int panjang;
  const Itemmenu({required this.builder, super.key, required this.panjang});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 55, maxHeight: 120),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: builder,
        itemCount: panjang,
      ),
    );
  }
}
