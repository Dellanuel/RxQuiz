import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'app_constants.dart';

Widget listTileShimmer() {
  return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListTile(
              leading: Container(
                height: 80,
                width: 90,
                decoration: BoxDecoration(color: whiteK, borderRadius: curved),
              ),
              title: Column(
                  children: List.generate(
                3,
                (index) => Container(
                  height: 10,
                  decoration:
                      BoxDecoration(color: whiteK, borderRadius: curved),
                ).paddingAll(5),
              )),
            ),
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 6);
}

Widget gridTileShimmer() {
  return SizedBox(
    width: 135,
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        dense: true,
        minVerticalPadding: 0,
        contentPadding: const EdgeInsets.all(0),
        title: Container(
          height: 150,
          decoration: BoxDecoration(color: whiteK, borderRadius: curved),
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              2,
              (index) => Container(
                    height: 10,
                    width: 70,
                    decoration:
                        BoxDecoration(color: whiteK, borderRadius: curved),
                  ).paddingAll(5)),
        ),
      ),
    ),
  );
}
