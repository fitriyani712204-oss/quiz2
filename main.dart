import 'package:flutter/material.dart';

// Import ini HANYA akan berhasil jika nama file Anda di folder 'lib'
// sudah diubah menjadi 'home_screen.dart', 'article_screen.dart', dst.
import 'home_screen.dart';
import 'article_screen.dart';
import 'booking_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Definisikan warna kustom untuk tema baru
  static const Color primaryPink = Color.fromARGB(
    255,
    27,
    79,
    114,
  ); // Pink utama
  static const Color accentBlue = Color(0xFF80D8FF); // Biru Muda aksen

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI/UX Mockup (3 Screens)',
      theme: ThemeData(
        // Menggunakan primaryPink sebagai warna utama (Primary Color)
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: accentBlue,
          backgroundColor: Colors.white,
          cardColor: Colors.white,
        ).copyWith(secondary: accentBlue),
        useMaterial3: true,
      ),
      home: const TabScreen(),
    );
  }
}

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  // Data Kredit Pembuat (Ganti sesuai Nama dan NIM Anda)
  final String designerName = 'Yogi';
  final String designerNIM = '232101130';

  @override
  Widget build(BuildContext context) {
    // Kita tetap menggunakan DefaultTabController untuk mengontrol TabBarView
    // agar layar dapat di-swipe, meskipun TabBar (header) tidak ditampilkan.
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // Hapus AppBar di sini (header)

        // TabBarView dengan 'const'
        body: const TabBarView(
          // Pastikan TabBarView TIDAK memiliki physics (ScrollPhysics)
          // jika Anda tidak ingin pengguna menggeser antar tab.
          // Jika Anda ingin tetap bisa swipe, biarkan default.
          children: [HomeScreen(), ArticleScreen(), BookingScreen()],
        ),

        // Hapus bottomNavigationBar di sini (footer/kredit)
      ),
    );
  }
}
