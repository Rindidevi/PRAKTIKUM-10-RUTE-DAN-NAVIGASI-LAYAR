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
        primarySwatch: Colors.purple, // Mengatur tema warna utama menjadi ungu.
      ),
      initialRoute: '/', // Menetapkan nama rute awal.
      routes: {
        '/': (BuildContext context) => const FirstScreen(title: 'Flutter Demo Home Page'), // Menetapkan rute awal ke FirstScreen.
        '/second': (BuildContext context) => const SecondScreen(value: 0) // Menetapkan rute kedua ke SecondScreen.
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  // Definisi kelas FirstScreen yang merupakan turunan dari StatelessWidget.
  const FirstScreen({Key? key, required this.title}) : super(key: key); 
  // Konstruktor FirstScreen yang menerima key dan title sebagai parameter.

  final String title; // Properti final untuk menyimpan judul layar.

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'), // Menampilkan judul di AppBar.
        backgroundColor: Colors.purple, // Mengubah warna AppBar menjadi ungu.
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple, // Mengubah warna tombol menjadi ungu.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // Mengatur radius tombol menjadi 5.
            ),
          ),
          child: const Text(
            'Buka Screen 2', // Teks pada tombol.
            style: TextStyle(color: Colors.white), // Mengubah warna teks tombol menjadi putih.
          ),
          onPressed: () {
            // Navigasi ke layar kedua dan mengirim data.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const SecondScreen(value: 2020); // Menampilkan SecondScreen dan mengirim data 2020.
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  // Definisi kelas SecondScreen yang merupakan turunan dari StatelessWidget.
  final int value; // Properti untuk menyimpan nilai yang dikirim dari FirstScreen.

  const SecondScreen({Key? key, required this.value}) : super(key: key); 
  // Konstruktor SecondScreen yang menerima key dan value sebagai parameter.

  @override
  Widget build(BuildContext context) {
    // Metode build untuk mendefinisikan tampilan dari widget.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'), // Menampilkan judul di AppBar.
        backgroundColor: Colors.purple, // Mengubah warna AppBar menjadi ungu.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi children di tengah secara vertikal.
          children: <Widget>[
            const SizedBox(height: 20.0), // Memberi jarak vertikal 20.0 unit.
            Text('Nilai yang dikirim : $value'), // Menampilkan teks nilai yang dikirim.
            const SizedBox(height: 10.0), // Memberi jarak vertikal 10.0 unit.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Mengubah warna tombol menjadi ungu.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Mengatur radius tombol menjadi 5.
                ),
              ),
              child: const Text(
                'Kembali ke Screen 1', // Teks pada tombol.
                style: TextStyle(color: Colors.white), // Mengubah warna teks tombol menjadi putih.
              ),
              onPressed: () {
                Navigator.pop(context); // Kembali ke layar sebelumnya (FirstScreen).
              },
            ),
          ],
        ),
      ),
    );
  }
}
