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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Detail Gunung'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/fb/3d/e8/photo1jpg.jpg?w=1800&h=1000&s=1',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: const Text(
                  'Gunung Matantimali',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        Icon(Icons.calendar_month_outlined),
                        SizedBox(height: 8.0),
                        Text('Buka setiap hari')
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.lock_clock_rounded),
                        SizedBox(height: 8.0),
                        Text('07:00 - 23:00')
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.money),
                        SizedBox(height: 8.0),
                        Text('Rp 24.000')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Gunung Matantimali adalah permata tersembunyi di Sulawesi Tengah.  Dengan letaknya yang strategis, gunung ini menawarkan pemandangan yang berbeda setiap saat.  Pada pagi hari, kamu bisa menyaksikan matahari terbit yang memukau.  Sedangkan pada sore hari, kamu bisa menikmati keindahan sunset yang romantis.  Selain itu, Gunung Matantimali juga menjadi habitat bagi berbagai jenis flora dan fauna endemik.  Bagi para pecinta alam, tempat ini adalah surga yang tak boleh dilewatkan.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/90/58/de/img-20160814-075941-largejpg.jpg?w=1600&h=900&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/f1/ae/37/edisi-jalan-jalan-akhir.jpg?w=1600&h=900&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/9b/b3/bc/gunung-matantimali.jpg?w=1800&h=1000&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/90/58/e1/img-20160814-074909-largejpg.jpg?w=1600&h=900&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/d0/6d/fd/pemandangan-gunung-hijau.jpg?w=1800&h=-1&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/d0/6e/26/view-dari-puncak.jpg?w=1800&h=-1&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Like/Dislike section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up),
                    onPressed: like,
                  ),
                  Text('$likes', style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.thumb_down),
                    onPressed: dislike,
                  ),
                  Text('$dislikes', style: const TextStyle(fontSize: 20)),
                ],
              ),
              const SizedBox(height: 20),
              // Comment section
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Komentar',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(comments[index]),
                          );
                        },
                      ),
                    ),
                    TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                        labelText: 'Tulis komentar...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: addComment,
                      child: const Text('Kirim'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
