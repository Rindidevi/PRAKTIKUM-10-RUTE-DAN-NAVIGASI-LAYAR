// Mengimpor paket Flutter yang dibutuhkan
import 'package:flutter/material.dart';

// Fungsi utama yang dijalankan pertama kali saat aplikasi dibuka
void main() {
  runApp(const Aplikasiku()); // Menjalankan aplikasi 'Aplikasiku'
}

// Kelas utama aplikasi, berupa widget tanpa status (stateless)
class Aplikasiku extends StatelessWidget {
  const Aplikasiku({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Flutter', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna utama tema aplikasi
      ),
      initialRoute: '/login', // Rute awal yang ditampilkan
      routes: {
        '/login': (context) => const HalamanLogin(), // Rute untuk halaman login
        '/home': (context) =>
            const HalamanBeranda(), // Rute untuk halaman beranda
        '/product': (context) =>
            const HalamanProduk(), // Rute untuk halaman produk
        '/profile': (context) =>
            const HalamanProfil(), // Rute untuk halaman profil
        '/about': (context) =>
            const HalamanTentangAplikasi(), // Rute untuk halaman tentang aplikasi
      },
    );
  }
}

// Kelas untuk halaman login, berupa widget dengan status (stateful)
class HalamanLogin extends StatefulWidget {
  const HalamanLogin({Key? key}) : super(key: key);

  @override
  _HalamanLoginState createState() =>
      _HalamanLoginState(); // Membuat state untuk HalamanLogin
}

// State untuk HalamanLogin
class _HalamanLoginState extends State<HalamanLogin> {
  final _formKey = GlobalKey<FormState>(); // Kunci global untuk form
  final TextEditingController _kontrolerUsername =
      TextEditingController(); // Kontroler untuk input username
  final TextEditingController _kontrolerEmail =
      TextEditingController(); // Kontroler untuk input email
  final TextEditingController _kontrolerPassword =
      TextEditingController(); // Kontroler untuk input password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        backgroundColor: Colors.purple, // Warna latar belakang ungu
      ),
      body: SingleChildScrollView(
        // Membuat tampilan bisa digulir
        child: Padding(
          padding:
              const EdgeInsets.all(30.0), // Padding 16 piksel di semua sisi
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Konten di tengah secara vertikal
            children: <Widget>[
              Image.asset(
                'images/logo_login.png', // Gambar logo
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 20), // Spasi vertikal 20 piksel
              Form(
                key: _formKey, // Menyambungkan form ke kunci global
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller:
                          _kontrolerUsername, // Menghubungkan kontroler ke input
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                            Icons.person), // Ikon person di depan input
                      ),
                      validator: (value) {
                        // Validasi input
                        if (value == null || value.isEmpty) {
                          return 'Username tidak boleh kosong'; // Pesan error jika kosong
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20), // Spasi vertikal 20 piksel
                    TextFormField(
                      controller:
                          _kontrolerEmail, // Menghubungkan kontroler ke input
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(
                            Icons.email), // Ikon email di depan input
                      ),
                      validator: (value) {
                        // Validasi input
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong'; // Pesan error jika kosong
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Email tidak valid'; // Pesan error jika format tidak valid
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20), // Spasi vertikal 20 piksel
                    TextFormField(
                      controller:
                          _kontrolerPassword, // Menghubungkan kontroler ke input
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        prefixIcon:
                            const Icon(Icons.lock), // Ikon kunci di depan input
                      ),
                      obscureText: true, // Menyembunyikan teks input
                      validator: (value) {
                        // Validasi input
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong'; // Pesan error jika kosong
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20), // Spasi vertikal 20 piksel
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Validasi form
                          Navigator.pushReplacementNamed(
                            context,
                            '/home', // Navigasi ke halaman beranda
                            arguments: {
                              'username': _kontrolerUsername
                                  .text, // Mengirim data username
                              'email':
                                  _kontrolerEmail.text, // Mengirim data email
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // Warna background ungu
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5), // Radius sudut 5
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: const Text(
                        'Login',
                        style:
                            TextStyle(color: Colors.white), // Warna teks putih
                      ),
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

// Kelas untuk halaman beranda, berupa widget tanpa status (stateless)
class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil data user yang dikirim dari halaman login
    final userData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>? ??
            {'username': 'Guest', 'email': 'guest@example.com'};

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beranda',
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        backgroundColor: Colors.purple, // Warna latar belakang ungu
      ),
      drawer: buatDrawer(context, userData), // Membuat drawer dengan data user
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding 16 piksel di semua sisi
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Selamat Datang di Nge IceCream KUY!',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40), // Spasi vertikal 40 piksel
                  Text(
                    'Rasakan Sensasi Manis dan Segar dengan Ice Cream Kami. Di Nge IceCream KUY, kami menyajikan kelezatan es krim premium yang akan memanjakan lidah Anda. Dari rasa klasik hingga kreasi unik, kami menawarkan berbagai pilihan yang pasti memuaskan selera Anda.',
                    textAlign: TextAlign.justify, // Menyelaraskan teks
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20), // Spasi horizontal 20 piksel
            Image.asset(
              'images/ice2.jpg', // Gambar ice cream
              fit: BoxFit.cover,
              height: 600,
              width: 600,
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas untuk halaman produk, berupa widget tanpa status (stateless)
class HalamanProduk extends StatelessWidget {
  const HalamanProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data produk
    final List<Map<String, dynamic>> products = [
      {'name': 'Vanilla', 'price': 'Rp 10.000', 'image': 'images/vanila.jpg'},
      {'name': 'Chocolate', 'price': 'Rp 12.000', 'image': 'images/coklat.jpg'},
      {
        'name': 'Strawberry',
        'price': 'Rp 15.000',
        'image': 'images/stroberi.jpg'
      },
      {'name': 'Matcha', 'price': 'Rp 13.000', 'image': 'images/matcha.jpg'},
      {'name': 'Vanilla', 'price': 'Rp 10.000', 'image': 'images/vanila.jpg'},
      {'name': 'Chocolate', 'price': 'Rp 12.000', 'image': 'images/coklat.jpg'},
      {
        'name': 'Strawberry',
        'price': 'Rp 15.000',
        'image': 'images/stroberi.jpg'
      },
      {'name': 'Matcha', 'price': 'Rp 13.000', 'image': 'images/matcha.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produk',
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        backgroundColor: Colors.purple, // Warna latar belakang ungu
      ),
      drawer: buatDrawer(context, {}), // Membuat drawer (tanpa data user)
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding 16 piksel di semua sisi

        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Dua kolom per baris
            crossAxisSpacing: 10.0, // Spasi horizontal antar item
            mainAxisSpacing: 10.0, // Spasi vertikal antar item
            childAspectRatio: 0.75, // Rasio aspek item (lebar : tinggi)
          ),
          itemCount: products.length, // Jumlah item sesuai jumlah produk
          itemBuilder: (BuildContext context, int index) {
            final product =
                products[index]; // Mengambil produk berdasarkan index
            return Card(
              elevation: 5, // Tinggi bayangan
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, // Mengatur lebar kolom sesuai parent
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Padding 8 piksel di semua sisi
                      child: Image.asset(
                        product['image'], // Menampilkan gambar produk
                        fit: BoxFit
                            .cover, // Menyesuaikan gambar dengan ukuran kotak
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Padding 8 piksel di semua sisi
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Teks dimulai dari kiri
                      children: [
                        Text(
                          product['name'], // Nama produk
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5), // Spasi vertikal 5 piksel
                        Row(
                          children: [
                            const Icon(
                              Icons.attach_money,
                              color: Colors.purple,
                              size: 16,
                            ),
                            const SizedBox(
                                width: 5), // Spasi horizontal 5 piksel
                            Text(
                              product['price'], // Harga produk
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Kelas untuk halaman profil, berupa widget tanpa status (stateless)
class HalamanProfil extends StatelessWidget {
  const HalamanProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil data user yang dikirim dari halaman sebelumnya
    final userData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>? ??
            {'username': 'Guest', 'email': 'guest@example.com'};

    // Kontroler untuk input nama dan email, diisi dengan data user
    final TextEditingController _kontrolerNama =
        TextEditingController(text: userData['username']);
    final TextEditingController _kontrolerEmail =
        TextEditingController(text: userData['email']);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        backgroundColor: Colors.purple, // Warna latar belakang ungu
      ),
      drawer: buatDrawer(context, userData), // Membuat drawer dengan data user
      body: Padding(
        padding: const EdgeInsets.all(100.0), // Padding 16 piksel di semua sisi
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _kontrolerNama, // Menghubungkan kontroler ke input
              decoration: InputDecoration(
                labelText: 'Nama',
                border: const OutlineInputBorder(),
                prefixIcon:
                    const Icon(Icons.person), // Ikon person di depan input
              ),
              readOnly: true, // Hanya bisa dibaca, tidak bisa diubah
            ),
            const SizedBox(height: 20), // Spasi vertikal 20 piksel
            TextFormField(
              controller: _kontrolerEmail, // Menghubungkan kontroler ke input
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                prefixIcon:
                    const Icon(Icons.email), // Ikon email di depan input
              ),
              readOnly: true, // Hanya bisa dibaca, tidak bisa diubah
            ),
            const SizedBox(height: 20), // Spasi vertikal 20 piksel
            ElevatedButton(
              onPressed: () {
                // Placeholder untuk fungsionalitas ubah password
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Warna background ungu
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Radius sudut 5
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Ubah Password',
                style: TextStyle(color: Colors.white), // Warna teks putih
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Kelas untuk halaman tentang aplikasi, berupa widget tanpa status (stateless)
class HalamanTentangAplikasi extends StatelessWidget {
  const HalamanTentangAplikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil data user yang dikirim dari halaman sebelumnya
    final userData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>? ??
            {'username': 'Guest', 'email': 'guest@example.com'};

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang Aplikasi',
          style: TextStyle(color: Colors.white), // Warna teks putih
        ),
        backgroundColor: Colors.purple, // Warna latar belakang ungu
      ),
      drawer: buatDrawer(context, userData), // Membuat drawer dengan data user
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(85.0), // Padding 16 piksel di semua sisi
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Teks dimulai dari kiri
          children: [
            const Center(
              child: Text(
                'Selamat Datang di Nge IceCream KUY!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20), // Spasi vertikal 20 piksel
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    AssetImage('images/rindivi.jpg'), // Gambar pemilik usaha
              ),
            ),
            const SizedBox(height: 20), // Spasi vertikal 20 piksel
            const Text(
              'Nge IceCream KUY adalah aplikasi yang dirancang khusus untuk pecinta es krim di seluruh Indonesia. Dibuat oleh Rindi Devi, seorang pengembang web dengan passion terhadap teknologi dan makanan, aplikasi ini hadir untuk menjembatani kebutuhan akan es krim berkualitas yang mudah diakses.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20), // Spasi vertikal 20 piksel
            const Text(
              'Tentang Pemilik Usaha',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Spasi vertikal 10 piksel
            const Text(
              'Rindi Devi, pemilik dari Nge IceCream KUY, adalah seorang pengusaha muda yang berkomitmen untuk memajukan industri kuliner lokal, khususnya es krim. Dengan pengalaman bertahun-tahun dalam industri makanan dan minuman, Rindi Devi membawa inovasi dan semangat baru dalam setiap produk yang ditawarkan.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20), // Spasi vertikal 20 piksel
            const Text(
              'Visi Kami',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Spasi vertikal 10 piksel
            const Text(
              'Menjadi aplikasi es krim terdepan yang menghubungkan para pencinta es krim dengan penjual es krim lokal, serta menghadirkan pengalaman menikmati es krim yang menyenangkan dan mudah diakses.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20), // Spasi vertikal 20 piksel
            const Text(
              'Misi Kami',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Spasi vertikal 10 piksel
            const Text(
              'Misi kami di Nge IceCream KUY adalah untuk mempermudah akses pencinta es krim dalam menemukan dan memesan varian es krim terbaik dari penjual lokal, menyajikan inovasi dan kreativitas dalam pilihan es krim yang ditawarkan, sehingga memberikan pengalaman menikmati es krim yang menyenangkan dan mudah diakses oleh semua orang.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

// Fungsi untuk membuat drawer (menu samping)
Widget buatDrawer(BuildContext context, Map<String, String> userData) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(userData['username'] ?? 'Guest'), // Nama user
          accountEmail:
              Text(userData['email'] ?? 'guest@example.com'), // Email user
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              userData['username']?.substring(0, 1) ?? 'G', // Inisial user
              style: const TextStyle(fontSize: 40.0, color: Colors.purple),
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.purple, // Warna latar belakang ungu
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Beranda'),
          onTap: () {
            Navigator.pushNamed(
                context, '/home'); // Navigasi ke halaman beranda
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Produk'),
          onTap: () {
            Navigator.pushNamed(
                context, '/product'); // Navigasi ke halaman produk
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profil'),
          onTap: () {
            Navigator.pushNamed(context, '/profile',
                arguments: userData); // Navigasi ke halaman profil
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Tentang Aplikasi'),
          onTap: () {
            Navigator.pushNamed(
                context, '/about'); // Navigasi ke halaman tentang aplikasi
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            Navigator.pushReplacementNamed(
                context, '/login'); // Navigasi ke halaman login
          },
        ),
      ],
    ),
  );
}
