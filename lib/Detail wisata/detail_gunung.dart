import 'package:flutter/material.dart';

class DetailGunung extends StatefulWidget {
  const DetailGunung({super.key});

  @override
  State<DetailGunung> createState() => _DetailGunungState();
}

class _DetailGunungState extends State<DetailGunung> {
  List<String> comments = [];
  final TextEditingController commentController = TextEditingController();
  int likes = 0;
  int dislikes = 0;

  void addComment() {
    if (commentController.text.isNotEmpty) {
      setState(() {
        comments.add(commentController.text);
        commentController.clear();
      });
    }
  }

  void like() {
    setState(() {
      likes++;
    });
  }

  void dislike() {
    setState(() {
      dislikes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.7),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/fb/3d/e8/photo1jpg.jpg?w=1800&h=1000&s=1',
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Gunung Matantimali',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.thumb_up,
                                          color: likes > 0
                                              ? Colors.blue
                                              : Colors.grey),
                                      onPressed: like,
                                    ),
                                    Text('$likes'),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.red, size: 20),
                                const SizedBox(width: 5),
                                const Text('Sulawesi Tengah, Indonesia'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildInfoItem(
                                Icons.height, '2.300 mdpl', 'Ketinggian'),
                            _buildDivider(),
                            _buildInfoItem(
                                Icons.timer, '6-7 jam', 'Waktu Pendakian'),
                            _buildDivider(),
                            _buildInfoItem(
                                Icons.landscape, 'Sedang', 'Tingkat Kesulitan'),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Gunung Matantimali adalah permata tersembunyi di Sulawesi Tengah. Dengan letaknya yang strategis, gunung ini menawarkan pemandangan yang berbeda setiap saat. Pada pagi hari, kamu bisa menyaksikan matahari terbit yang memukau. Sedangkan pada sore hari, kamu bisa menikmati keindahan sunset yang romantis. Selain itu, Gunung Matantimali juga menjadi habitat bagi berbagai jenis flora dan fauna endemik.',
                          style: TextStyle(
                            height: 1.5,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Galeri Foto',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildGalleryImage(
                                'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/90/58/de/img-20160814-075941-largejpg.jpg?w=1600&h=900&s=1'),
                            _buildGalleryImage(
                                'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/f1/ae/37/edisi-jalan-jalan-akhir.jpg?w=1600&h=900&s=1'),
                            _buildGalleryImage(
                                'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/9b/b3/bc/gunung-matantimali.jpg?w=1800&h=1000&s=1'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Komentar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: comments.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    title: Text(comments[index]),
                                    subtitle: const Text('Pengunjung'),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: 'Tulis komentar...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: addComment,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildGalleryImage(String url) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
