import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/af/19/19/menunggu-uang-koin.jpg?w=2000&h=-1&s=1',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: const Text(
                  'Pantai',
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
                        Icon(Icons.calendar_view_day_rounded),
                        SizedBox(height: 8.0),
                        Text('Jam buka')
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.lock_clock_rounded),
                        SizedBox(height: 8.0),
                        Text('10:00-01:00')
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
                  'Sulawesi Tengah menyimpan sejuta pesona pantai yang memukau. Pasir putih lembut, air laut jernih kebiruan, dan deburan ombak yang menenangkan siap menyambutmu.  Dari Pantai Talise yang ikonik di Palu hingga pantai-pantai tersembunyi di Kepulauan Togian, setiap sudut pantai di Sulteng menawarkan keindahan alam yang berbeda.  Rasakan sensasi berenang di air laut yang hangat, bermain pasir bersama keluarga, atau sekadar menikmati pemandangan matahari terbenam yang memukau.  Sulteng adalah surga bagi para pecinta pantai, tunggu apalagi? Yuk, rencanakan liburanmu sekarang!',
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
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/79/d6/32/photo0jpg.jpg?w=900&h=400&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/67/82/f9/p-20190203-085332-largejpg.jpg?w=900&h=500&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/67/82/f8/p-20190203-085246-largejpg.jpg?w=900&h=500&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/ac/53/08/view-of-the-coast-west.jpg?w=900&h=500&s=1',
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
