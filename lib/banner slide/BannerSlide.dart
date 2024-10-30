import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Bannerslide extends StatelessWidget {
  const Bannerslide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Destinasi Wisata',
          style: GoogleFonts.arimo(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff608BC1),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: AnotherCarousel(
              images: const [
                AssetImage("images/gunung1.jpg"),
                AssetImage("images/pantai1.jpg"),
                AssetImage("images/pantai2.jpg"),
                NetworkImage(
                  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/fb/3d/e7/photo0jpg.jpg?w=2200&h=-1&s=1",
                ),
                NetworkImage(
                  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/c7/ee/14/20180317-130046-largejpg.jpg?w=1000&h=-1&s=1",
                ),
              ],
              dotSize: 4,
              indicatorBgPadding: 5.0,
            ),
          ),
        ],
      ),
    );
  }
}
