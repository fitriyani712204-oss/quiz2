import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna yang digunakan dalam desain
    const Color greenPrimary = Color(0xFF5A793B);
    const Color yellowAccent = Color(0xFFE9C46A);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Pattern
                  Container(
                    height: 150,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [greenPrimary, yellowAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),

                  // Judul
                  const Text(
                    'About a panic attack',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'How does it nourish itself',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 25),

                  // Paragraf Konten
                  const Text(
                    'A panic attack is an attack of acute fear, horror, and a mixture of otherworldly feeling. Perform breathing exercises and make an appointment with a psychologist.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 30),

                  // ------------------------------------------------
                  // >>> AREA TEXT BARU 1: Di bawah Paragraf Utama
                  // ------------------------------------------------
                  const Text(
                    'Teks area pertama: Anda bisa mengisi ini dengan detail tambahan tentang serangan panik atau kiat pertama.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // ------------------------------------------------
                  // >>> AREA TEXT BARU 2: Dengan Icon Panah Kanan
                  // ------------------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gejala Serangan Panik',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Pelajari tanda-tanda peringatan dan pemicu utama.',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    thickness: 1,
                  ), // Garis pemisah visual
                  // Bagian Breathing Exercises (dipindahkan ke bawah area teks baru)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Breathing exercises',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Effective, harmless ways to relieve stress',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromARGB(255, 104, 4, 4),
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50), // Ruang kosong sebelum tombol
                ],
              ),
            ),
          ),

          // Tombol Booking Consultation (Sticky)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan navigasi ke BookingScreen di sini
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 150, 25, 25),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Booking consultation',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 178, 9, 107),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Pembuat:Yogi | NIM: 232101130',
              style: TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 159, 6, 134),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
