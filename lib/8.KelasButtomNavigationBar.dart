import 'package:flutter/material.dart'; // Mengimpor paket material design dari Flutter.

void main() {
  runApp(const MyApp()); // Fungsi utama yang menjalankan aplikasi dengan widget MyApp sebagai root.
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Konstruktor MyApp yang menerima key optional.

  @override
  Widget build(BuildContext context) {
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
  const MainPage({Key? key}) : super(key: key); // Konstruktor MainPage yang menerima key optional.

  @override
  _MainPageState createState() => _MainPageState(); // Mengembalikan state dari MainPage.
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Menyimpan indeks halaman yang dipilih.
  final _pages = [
    const Home(), // Daftar halaman yang akan ditampilkan dalam BottomNavigationBar.
    const Product(),
    const Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coba Bottom Navigation'), // Judul pada AppBar.
        backgroundColor: Colors.purple, // Mengatur warna latar belakang AppBar menjadi ungu.
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Daftar item dalam BottomNavigationBar.
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk halaman Home.
            label: 'Home', // Label untuk halaman Home.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart), // Ikon untuk halaman Product.
            label: 'Product', // Label untuk halaman Product.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Ikon untuk halaman Profile.
            label: 'Profil', // Label untuk halaman Profile.
          ),
        ],
        currentIndex: _selectedIndex, // Menetapkan indeks halaman yang dipilih.
        selectedItemColor: Colors.purple, // Warna ikon saat item dipilih (ungu).
        unselectedItemColor: Colors.grey, // Warna ikon saat item tidak dipilih (abu-abu).
        type: BottomNavigationBarType.fixed, // Menetapkan jenis BottomNavigationBar menjadi fixed.
        onTap: (index) {
          // Callback yang dipanggil saat salah satu item diklik.
          setState(() {
            _selectedIndex = index; // Mengubah indeks halaman yang dipilih sesuai dengan yang diklik.
          });
        },
        selectedIconTheme: IconThemeData(color: Colors.purple), // Warna ikon saat dipilih (ungu).
        unselectedIconTheme: IconThemeData(color: Colors.grey), // Warna ikon saat tidak dipilih (abu-abu).
      ),
      body: _pages.elementAt(_selectedIndex), // Menampilkan halaman sesuai dengan indeks yang dipilih.
    );
  }
}

// Halaman yang dipanggil dari TabBarView tidak memerlukan Scaffold lagi.
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key); // Konstruktor Home yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman Home'), // Menampilkan teks di tengah halaman.
    );
  }
}

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key); // Konstruktor Product yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman Product'), // Menampilkan teks di tengah halaman.
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key); // Konstruktor Profil yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman Profile'), // Menampilkan teks di tengah halaman.
    );
  }
}
