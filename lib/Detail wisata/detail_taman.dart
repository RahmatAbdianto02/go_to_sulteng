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
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/fb/f2/7d/caption.jpg?w=1400&h=-1&s=1',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: const Text(
                  'Taman Nasional Lore Lindu',
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
                        Icon(Icons.money_sharp),
                        SizedBox(height: 8.0),
                        Text('Rp 50.000')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  ' Di dalam kawasan ini terdapat berbagai jenis satwa liar dan spesis endemik Sulawesi Tengah peninggalan purbakala berupa patung-patung megalitikum yang diperkirakan berusia sekitar 5000-3500 tahun yang dibuat oleh bangsa Austronesia. Di sekitar kawasan ini juga terdapat perkampungan penduduk asli yang hidup bergantung pada alam yang ada di dalamnya. Kawasan ini dibuka bagi wisatawan untuk melakukan aktifitas trekking dan penelitian. Bagi anda yang ingin berkunjung ke sini kami selalu siap dan menyiapkan pemandu-pemandu khusus yang memiliki pengetahuan tentang arkeologis dan satwa liar.',
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
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/fb/f2/7b/caption.jpg?w=1400&h=-1&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/94/5d/14/2017-03-03-07-31-51-863.jpg?w=1600&h=-1&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/ff/04/a3/sulawesi-scops-owl.jpg?w=1400&h=800&s=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/a0/d5/30/lore-lindu-national-park.jpg?w=1100&h=-1&s=1',
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
