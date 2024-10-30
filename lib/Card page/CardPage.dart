import 'package:flutter/material.dart';
import 'package:go_to_sulteng/Detail%20wisata/detail_gunung.dart';
import 'package:go_to_sulteng/Detail%20wisata/detail_screen.dart';
import 'package:go_to_sulteng/Detail%20wisata/detail_taman.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Destinasi Wisata',
          style: GoogleFonts.arimo(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff4A90E2),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              width: double.infinity,
              child: AnotherCarousel(
                images: const [
                  AssetImage("images/gunung1.jpg"),
                  AssetImage("images/pantai1.jpg"),
                  AssetImage("images/pantai2.jpg"),
                  NetworkImage(
                      "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/fb/3d/e7/photo0jpg.jpg?w=2200&h=-1&s=1"),
                  NetworkImage(
                      "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/c7/ee/14/20180317-130046-largejpg.jpg?w=1000&h=-1&s=1"),
                ],
                dotSize: 4,
                indicatorBgPadding: 5.0,
              ),
            ),
            const SizedBox(height: 16),
            CustomCard(
              imageUrl:
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/0f/4b/df/taman-nasional-kepulauan.jpg?w=2000&h=-1&s=1',
              title: 'Pantai',
              subtitle:
                  'Jelajahi keindahan alam Sulawesi Tengah yang eksotis\nNikmati matahari terbenam yang memukau di pantai-pantai yang masih alami',
              buttonText: 'Klik untuk detail pantai',
              detailPage: const DetailScreen(),
            ),
            CustomCard(
              imageUrl:
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/fb/3d/e9/photo2jpg.jpg?w=2200&h=-1&s=1',
              title: 'Gunung',
              subtitle:
                  'Rasakan petualangan mendaki puncak-puncak indah di Sulawesi Tengah.\nMenikmati keindahan alam dari ketinggian.',
              buttonText: 'Klik untuk detail gunung',
              detailPage: const DetailGunung(),
            ),
            CustomCard(
              imageUrl:
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/a0/d5/1a/lore-lindu-national-park.jpg?w=1100&h=-1&s=1',
              title: 'Taman Nasional Lore Lindu',
              subtitle:
                  'Lore Lindu merupakan kawasan hutan belantara yang dilindungi UU RI dan sudah masuk dalam usulan ke Unesco.',
              buttonText: 'Klik untuk detail taman',
              detailPage: const DetailTaman(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;
  final Widget detailPage;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.detailPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(
                title,
                style: GoogleFonts.arimo(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff333333),
                ),
              ),
              subtitle: Text(
                subtitle,
                style: GoogleFonts.arimo(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      buttonText,
                      style: GoogleFonts.arimo(
                          fontSize: 16, color: const Color(0xff4A90E2)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => detailPage),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
