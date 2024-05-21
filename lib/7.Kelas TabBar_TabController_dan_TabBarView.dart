import 'package:flutter/material.dart'; // Mengimpor paket material design dari Flutter.

void main() {
  runApp(const MyApp()); // Fungsi utama yang menjalankan aplikasi dengan widget MyApp sebagai root.
}

class MyApp extends StatelessWidget {
  // Definisi kelas MyApp yang merupakan turunan dari StatelessWidget.
  const MyApp({Key? key}) : super(key: key); // Konstruktor MyApp yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return MaterialApp(
      title: 'Flutter Demo', // Judul aplikasi.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Mengatur tema warna utama menjadi biru.
      ),
      home: const MainPage(), // Mengatur halaman awal aplikasi ke MainPage.
    );
  }
}

class MainPage extends StatefulWidget {
  // Definisi kelas MainPage yang merupakan turunan dari StatefulWidget.
  const MainPage({Key? key}) : super(key: key); // Konstruktor MainPage yang menerima key optional.

  @override
  _MainPageState createState() => _MainPageState(); // Mengembalikan state dari MainPage.
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  // State untuk MainPage yang mengontrol TabController.
  late TabController _tabController; // Deklarasi TabController.

  @override
  void initState() {
    super.initState();
    // Membuat objek dari class TabController dengan 3 tab.
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coba Tab Navigation'), // Judul pada AppBar.
        elevation: 7.0, // Ketinggian bayangan AppBar.
        backgroundColor: Colors.purple,
        bottom: TabBar(
          // Membuat objek dari class TabBar.
          tabs: const <Widget>[
            // Label pada setiap tab.
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Home'), // Label tab untuk Home.
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Product'), // Label tab untuk Product.
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Profile'), // Label tab untuk Profile.
            ),
          ],
          controller: _tabController, // Menghubungkan TabBar dengan TabController.
          indicatorColor: Colors.white, // Warna indikator aktif pada tab.
          labelColor: Colors.white, // Warna teks pada tab yang aktif (putih).
          unselectedLabelColor: Colors.white.withOpacity(0.5), // Warna teks pada tab yang tidak aktif (putih dengan opacity).
        ),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        // Menentukan warna teks pada AppBar menjadi putih.
      ),
      body: TabBarView(
        // Membuat objek dari class TabBarView.
        controller: _tabController, // Menghubungkan TabBarView dengan TabController.
        children: const <Widget>[
          Home(), // Halaman untuk tab Home.
          Product(), // Halaman untuk tab Product.
          Profil(), // Halaman untuk tab Profile.
        ],
      ),
    );
  }
}

// Halaman yang dipanggil dari TabBarView tidak memerlukan Scaffold lagi.
class Home extends StatelessWidget {
  // Definisi kelas Home yang merupakan turunan dari StatelessWidget.
  const Home({Key? key}) : super(key: key); // Konstruktor Home yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return const Center(
      child: Text('Halaman Home'), // Menampilkan teks di tengah halaman.
    );
  }
}

class Product extends StatelessWidget {
  // Definisi kelas Product yang merupakan turunan dari StatelessWidget.
  const Product({Key? key}) : super(key: key); // Konstruktor Product yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return const Center(
      child: Text('Halaman Product'), // Menampilkan teks di tengah halaman.
    );
  }
}

class Profil extends StatelessWidget {
  // Definisi kelas Profil yang merupakan turunan dari StatelessWidget.
  const Profil({Key? key}) : super(key: key); // Konstruktor Profil yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return const Center(
      child: Text('Halaman Profile'), // Menampilkan teks di tengah halaman.
    );
  }
}
