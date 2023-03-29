import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Film',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsListScreen(),
    );
  }
}

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Terbaru'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final newsId = (index + 1).toString();
          return ListTile(
            title: Text('Berita $newsId'),
            subtitle: Text('Deskripsi Film $newsId'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailScreen(
                    newsId: newsId,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({Key? key, required this.newsId}) : super(key: key);
  final String newsId;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Film'),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Image.network(
              "assets/bg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(
                  "Film ke ${widget.newsId}. A Man Called Otto berkisah tentang laki-laki tua pemarah bernama Otto Anderson. Pada suatu hari, Otto kedatangan tetangga baru, yaitu keluarga yang berasal dari Meksiko. Otto yang gila terhadap ketertiban dan ketenangan mulai merasa terganggu dengan kehadiran keluarga ini. Di sisi lain, tetangga barunya tetap berusaha akrab kepada Otto. A Man Called Otto menghadirkan kisah yang simpel tetapi begitu relate dengan kenyataan dalam kehidupan sehari-hari. Tom Hanks berperan sebagai Otto, seorang laki-laki lansia yang hidup seorang diri setelah istrinya meninggal. Akibat sifatnya yang pemarah dan perfeksionis, Otto hadir sebagai tetangga yang menyebalkan di perumahannya. Namun, keadaan mulai berubah ketika Marisol dan Tommy hadir sebagai tetangga barunya Otto. Berbanding terbalik dengan Otto, Marisol dan Tommy memiliki kepribadian yang hangat dan ceria. Interaksi antara Otto yang pemarah dengan Marisol yang begitu ramah berhasil menciptakan elemen komedi yang begitu hangat dan natural untuk filmnya. Ditambah lagi, kamu juga bisa bertemu tetangga lama Otto lainnya, yaitu Jimmy, yang juga enggak kalah kocak. Selain komedi, A Man Called Otto juga menampilkan elemen drama yang cukup kuat. Di balik interaksi Marisol dan Otto yang lucu, perbedaan sifat keduanya akhirnya menimbulkan konflik, yang mana akhirnya mengungkapkan kisah masa lalu Otto yang begitu sedih. Proses pembangunan hubungan Otto dengan para tetangganya benar-benar dibangun dengan cara yang begitu menghangatkan hati bagi siapa pun yang menontonnya.",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
