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
      // step 1: Mendefinisikan initialRoute dan routes.
      initialRoute: '/', // Menetapkan rute awal ke halaman Home.
      routes: {
        '/': (BuildContext context) => const Home(), // Menetapkan rute awal ke Home.
        '/product': (BuildContext context) => const Product(), 
        // Menetapkan rute ke halaman Product.
        '/profil': (BuildContext context) => const Profil(), 
        // Menetapkan rute ke halaman Profil.
      },
    );
  }
}

// step 2: Mendefinisikan Drawer dengan menambahkan widget-widget yang kita butuhkan.
Widget buildDrawer(BuildContext context) {
  // Fungsi untuk membangun widget Drawer.
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero, // Menghapus padding default ListView.
      children: <Widget>[
        // Widget untuk header akun pengguna di Drawer.
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
              // Menampilkan gambar profil dari URL yang diberikan.
              'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300',
            ),
          ),
          accountEmail: Text('rindi.devi@example.com'), // Menampilkan email pengguna.
          accountName: Text(
            'Rindi Devi', // Menampilkan nama pengguna dengan ukuran font 24.
            style: TextStyle(fontSize: 24.0),
          ),
          decoration: BoxDecoration(
            color: Colors.purple, // Mengatur latar belakang header menjadi ungu.
          ),
        ),
        // Item navigasi untuk Home.
        ListTile(
          title: const Text('Home'), // Teks untuk item Home.
          leading: const Icon(Icons.home), // Ikon untuk item Home.
          onTap: () {
            Navigator.pushReplacementNamed(context, '/'); // Navigasi ke halaman Home.
          },
        ),
        const Divider(), // Garis pemisah antar item.
        // Item navigasi untuk Product.
        ListTile(
          title: const Text('Product'), // Teks untuk item Product.
          leading: const Icon(Icons.add_shopping_cart), // Ikon untuk item Product.
          onTap: () {
            Navigator.pushReplacementNamed(context, '/product'); // Navigasi ke halaman Product.
          },
        ),
        const Divider(), // Garis pemisah antar item.
        // Item navigasi untuk Profile.
        ListTile(
          title: const Text('Profile'), // Teks untuk item Profile.
          leading: const Icon(Icons.person), // Ikon untuk item Profile.
          onTap: () {
            Navigator.pushReplacementNamed(context, '/profil'); // Navigasi ke halaman Profil.
          },
        ),
      ],
    ),
  );
}

// step 3: Menautkan drawer (buildDrawer) dengan halaman yang ada.
class Home extends StatelessWidget {
  // Definisi kelas Home yang merupakan turunan dari StatelessWidget.
  const Home({Key? key}) : super(key: key); // Konstruktor Home yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return Scaffold(
      drawer: buildDrawer(context), // Menambahkan Drawer ke Scaffold.
      appBar: AppBar(
        title: const Text('Home'), // Menampilkan judul di AppBar.
        backgroundColor: Colors.purple, // Mengubah warna AppBar menjadi ungu.
      ),
      body: const Center(
        child: Text('Halaman Home'), // Menampilkan teks di tengah halaman.
      ),
    );
  }
}

class Product extends StatelessWidget {
  // Definisi kelas Product yang merupakan turunan dari StatelessWidget.
  const Product({Key? key}) : super(key: key); // Konstruktor Product yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return Scaffold(
      drawer: buildDrawer(context), // Menambahkan Drawer ke Scaffold.
      appBar: AppBar(
        title: const Text('Product'), // Menampilkan judul di AppBar.
         backgroundColor: Colors.purple,
      ),
      body: const Center(
        child: Text('Halaman Product'), // Menampilkan teks di tengah halaman.
      ),
    );
  }
}

class Profil extends StatelessWidget {
  // Definisi kelas Profil yang merupakan turunan dari StatelessWidget.
  const Profil({Key? key}) : super(key: key); // Konstruktor Profil yang menerima key optional.

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return Scaffold(
      drawer: buildDrawer(context), // Menambahkan Drawer ke Scaffold.
      appBar: AppBar(
        title: const Text('Profile'), // Menampilkan judul di AppBar.
         backgroundColor: Colors.purple,
      ),
      body: const Center(
        child: Text('Halaman Profile'), // Menampilkan teks di tengah halaman.
      ),
    );
  }
}
