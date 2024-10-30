import 'package:flutter/material.dart';

class DetailTaman extends StatefulWidget {
  const DetailTaman({super.key});

  @override
  State<DetailTaman> createState() => _DetailTamanState();
}

class _DetailTamanState extends State<DetailTaman> {
  List<String> comments = [];
  final TextEditingController commentController = TextEditingController();
  int likes = 0;
  int dislikes = 0;
  bool isExpanded = false;

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Taman Nasional Lore Lindu',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/fb/f2/7d/caption.jpg?w=1400&h=-1&s=1',
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.green),
                          const SizedBox(width: 8.0),
                          const Text(
                            'Sulawesi Tengah, Indonesia',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: likes > 0 ? Colors.red : Colors.grey,
                            ),
                            onPressed: like,
                          ),
                          Text('$likes'),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Colors.green.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildInfoColumn(
                              Icons.park, 'Tipe', 'Taman Nasional'),
                          _buildInfoColumn(
                              Icons.landscape, 'Luas', '217.991 Ha'),
                          _buildInfoColumn(
                              Icons.attractions, 'Aktivitas', '10+'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tentang Taman Nasional',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Di dalam kawasan ini terdapat berbagai jenis satwa liar dan spesis endemik Sulawesi Tengah peninggalan purbakala berupa patung-patung megalitikum yang diperkirakan berusia sekitar 5000-3500 tahun yang dibuat oleh bangsa Austronesia.',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Colors.orange.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline, color: Colors.orange),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Informasi Kunjungan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  'Buka setiap hari (07:00 - 23:00)',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                Text(
                                  'Tiket Masuk: Rp 50.000',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Galeri Foto',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildGalleryItem(
                              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/fb/f2/7b/caption.jpg?w=1400&h=-1&s=1',
                              'Flora'),
                          _buildGalleryItem(
                              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/94/5d/14/2017-03-03-07-31-51-863.jpg?w=1600&h=-1&s=1',
                              'Fauna'),
                          _buildGalleryItem(
                              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/ff/04/a3/sulawesi-scops-owl.jpg?w=1400&h=800&s=1',
                              'Burung'),
                          _buildGalleryItem(
                              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/a0/d5/30/lore-lindu-national-park.jpg?w=1100&h=-1&s=1',
                              'Pemandangan'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Komentar Pengunjung',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.green[100],
                              child:
                                  const Icon(Icons.person, color: Colors.green),
                            ),
                            title: Text(comments[index]),
                            subtitle: Text('Pengunjung ${index + 1}'),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: commentController,
                            decoration: InputDecoration(
                              hintText: 'Bagikan pengalaman Anda...',
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                icon:
                                    const Icon(Icons.send, color: Colors.green),
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
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12.0,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildGalleryItem(String imageUrl, String label) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
