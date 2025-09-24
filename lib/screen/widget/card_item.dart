import 'package:flutter/material.dart';
import 'package:fundamental_submission1/api/data/api_service.dart';
import 'package:fundamental_submission1/api/model/restoran.dart';
import 'package:fundamental_submission1/static/route.dart';

class CardItem extends StatelessWidget {
  final RestoranlistDetail datalist;
  const CardItem({super.key, required this.datalist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.detail.name,
        arguments: datalist.id,
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 80,
            maxHeight: 120,
            minWidth: 500,
            maxWidth: double.infinity,
          ),
          child: Card(
            child: Padding(
              padding: EdgeInsetsGeometry.all(15),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Hero(
                        tag: "restoImage${datalist.pictureId}",
                        child: Image.network(
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                          "${Constant.imageUrl}/${datalist.pictureId}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              datalist.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on, size: 15),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    datalist.city,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star, size: 20),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                datalist.rating.toString(),
                                style: TextStyle(fontWeight: FontWeight.w400),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
