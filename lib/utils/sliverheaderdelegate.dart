import 'package:flutter/material.dart';

class Headerdelegate extends SliverPersistentHeaderDelegate {

  final double maxHeight;
  final double minHeight;
  final Widget anak;

  const Headerdelegate({required this.maxHeight,required this.minHeight, required this.anak});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return anak;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant Headerdelegate oldDelegate) {
  return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || anak != oldDelegate.anak;
  }
}