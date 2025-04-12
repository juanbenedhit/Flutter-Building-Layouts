import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Oeschinen Lake Campground';
    return MaterialApp(
      title: appTitle, // memberi judul pada app
      home: Scaffold(
        // memanggil widget Scaffold
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true, // membuat teks berada di tengah
          elevation: 6, // membuat shadow pada AppBar
          title: const Text(
            appTitle,
            style: TextStyle(
              // memberikan style seperti warna, fontsize, fontweight, dan letterSpacing untuk memberi jarak antar kata
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),

          // leading digunakan untuk menaruh widget di sisi kiri AppBar seperti icon arrow_back dibawah dan diberkan warna putih
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Ketika tombol ditekan, fungsi onPressed dipanggil tetapi pada code ini tidak diberi fungsi apapun
            },
            color: Colors.white,
          ),
        ),

        // SingleChildScrollView berguna untuk membuat tampilan menjadi scrollable
        // Column digunakan untuk membuat layout yang berbentuk vertikal
        body: const SingleChildScrollView(
          child: Column(
            children: [
              // memanggil widget ImageSection dan memberikan source gambar
              ImageSection(image: 'images/lake.jpg'),

              // memanggil widget TitleSection dan memberikan text pada nama dan lokasi
              TitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
              ),

              // memanggil widget ButtonSection
              ButtonSection(),

              // memanggil widget TextSection dan memberikan deskripsi
              TextSection(
                description:
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from '
                    'Kandersteg, followed by a half-hour walk through pastures '
                    'and pine forest, leads you to the lake, which warms to 20 '
                    'degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summ  er toboggan run.',
              ),
            ],
          ),
        ),

        // memanggil widget NavigationSection dan menaruhnya pada bagian bawah screen
        bottomNavigationBar: const NavigationSection(),
      ),
    );
  }
}

// Membuat class TitleSection untuk menampilkan teks name dan location
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              // Membuat teks berada di posisi start (paling kiri) secara horizontal
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),

                  // memberikan styling pada text name seperti font weight dan font size
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                // memberikan styling pada text location seperti warna abu abu dan font size 14
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),

          // memberi icon star pada teks dengan warna merah dan size 32 ditambah dengan teks yang berisi angka 4.1
          Icon(Icons.star, color: Colors.red, size: 32),
          const Text('4.1'),
        ],
      ),
    );
  }
}

// untuk menampilkan icon dan styling teks yang diambil dari ButtonWithText
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
          ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }
}

// untuk menampilkan teks yang nantinya digunakan untuk ButtonSection yang ada di atas dan memberi beberapa style seperti padding ,size, fontWeight, dan warna
class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 32),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

// untuk menampilkan teks description dan memberi beberapa style seperti softWrap
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

// untuk menampilkan gambar dan memberi beberapa style seperti width, height dan fit
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

// Navigation Bawah untuk pergi kehalaman lain tetapi belum bisa digunakan karena belum ada route
class NavigationSection extends StatelessWidget {
  const NavigationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Saya'),
      ],
      selectedItemColor: color,
    );
  }
}
