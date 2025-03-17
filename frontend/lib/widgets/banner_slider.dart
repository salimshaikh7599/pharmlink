import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final List<String> banners = [
    'assets/images/banner_free_delivery.png',
    'assets/images/banner_verified.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return Image.asset(banners[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}
