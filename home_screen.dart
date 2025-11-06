import 'package:flutter/material.dart';

// Asumsi file ini sudah ada dan diimpor di main.dart
import 'article_screen.dart';
import 'booking_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan untuk Side Bar (endDrawer)
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      // Implementasi Side Bar (Drawer) yang dapat di-toggle dari kanan
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'Menu Utama',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            // Opsi Navigasi ke Article Screen
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Lihat Artikel'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ArticleScreen(),
                  ),
                );
              },
            ),
            // Opsi Navigasi ke Booking Screen
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Jadwal Booking'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookingScreen(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About App'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Bagian Header: Profile (TL) & Menu Toggle (TR)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile (Top Left)
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        // Gunakan Icon/Warna jika tidak ada folder assets
                        backgroundColor: Colors.lightGreen,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          // Permintaan "Good morning di bawah profile"
                          Text('Welcome,', style: TextStyle(fontSize: 16)),
                          Text(
                            'Yogi',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Menu Toggle (Top Right)
                  Builder(
                    builder: (context) {
                      return IconButton(
                        icon: const Icon(Icons.menu, size: 30),
                        onPressed: () {
                          // Membuka endDrawer (Side Bar Kanan)
                          Scaffold.of(context).openEndDrawer();
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // 2. Search Bar
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 3. 3 Filter Kategori
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    // Dibatasi menjadi 3 Filter (sesuai permintaan)
                    _CategoryPill(text: 'For you', isSelected: true),
                    _CategoryPill(text: 'Relationships'),
                    _CategoryPill(text: 'Stress'),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // 4. 2 Rectangle (Icon Categories)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _IconCategory(icon: Icons.work, text: 'Career motivation'),
                  _IconCategory(
                    icon: Icons.people,
                    text: 'Relationship with parents',
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // 5. Daftar Artikel/Konten (Grid)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.9,
                  // Agar tampilan ini bisa discroll jika perlu
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    _ContentCard(
                      title: 'About a panic attack',
                      subtitle: 'How does it nourish itself',
                      color1: Color(0xFF90B050),
                      color2: Color(0xFFD6E37A),
                    ),
                    _ContentCard(
                      title: 'What to do if the future scares',
                      subtitle: 'The four-screen method',
                      color1: Color(0xFFC7A22E),
                      color2: Color(0xFFFFF07A),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // BottomNavigationBar DIHAPUS karena sudah menggunakan TabScreen di main.dart
    );
  }
}

// --- Komponen Pembantu (Tetap sama) ---

class _CategoryPill extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _CategoryPill({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class _IconCategory extends StatelessWidget {
  final IconData icon;
  final String text;

  const _IconCategory({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 80,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class _ContentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  const _ContentCard({
    required this.title,
    required this.subtitle,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar/Pattern
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Teks Konten
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
