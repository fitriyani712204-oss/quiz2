import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Tahun diubah ke 2025
  DateTime selectedDate = DateTime(2025, 6, 17);
  String? selectedTime = '10:00 AM'; // Waktu default

  // Data Waktu Tersedia (Contoh)
  final List<String> availableTimes = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
  ];

  // Warna utama dari desain
  final Color primaryColor = const Color(0xFF5A793B);
  final Color accentColor = const Color(0xFFD6E37A);

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header & Tombol Kembali
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Booking consultation',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Konten utama dalam bentuk Card
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  // Tambahkan SingleChildScrollView
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Spesialis Kami
                      const Text(
                        'Our specialists',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _SpecialistPill(
                            name: 'Lory Ford',
                            experience: '3 years of experience',
                            isHighlighted: false,
                          ),
                          const SizedBox(width: 10),
                          _SpecialistPill(
                            name: 'Kate Carter',
                            experience: '7 years of experience',
                            isHighlighted: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Kalender (tanpa Expanded agar tidak memakan semua sisa ruang)
                      _CalendarWidget(
                        primaryColor: primaryColor,
                        accentColor: accentColor,
                        selectedDate: selectedDate,
                        onDateSelected: _onDateSelected,
                      ),
                      const SizedBox(height: 30),

                      // Pemilihan Waktu
                      const Text(
                        'Select time',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        // Gunakan Wrap untuk tata letak waktu yang responsif
                        spacing: 10,
                        runSpacing: 10,
                        children: availableTimes.map((time) {
                          return _TimeSlot(
                            time: time,
                            primaryColor: primaryColor,
                            isSelected: selectedTime == time,
                            onTap: () {
                              setState(() {
                                selectedTime = time;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 30),

                      // Tombol Booking
                      ElevatedButton(
                        onPressed: () {
                          // Logika Booking
                          print(
                            'Booking made for ${selectedDate.toString().split(' ')[0]} at $selectedTime',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Booking',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Pembuat: Yogi | NIM: 232101130',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Komponen Pembantu
class _SpecialistPill extends StatelessWidget {
  final String name;
  final String experience;
  final bool isHighlighted;

  const _SpecialistPill({
    required this.name,
    required this.experience,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    final Color highlightColor = const Color(0xFF5A793B);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isHighlighted ? highlightColor : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isHighlighted ? highlightColor : Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: isHighlighted
                ? Colors.white
                : Colors.grey.shade200,
            child: isHighlighted
                ? const Icon(Icons.person, size: 15, color: Color(0xFF5A793B))
                : const Icon(Icons.person, size: 15, color: Colors.grey),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isHighlighted ? Colors.white : Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                experience,
                style: TextStyle(
                  color: isHighlighted
                      ? Colors.white.withOpacity(0.8)
                      : Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimeSlot extends StatelessWidget {
  final String time;
  final Color primaryColor;
  final bool isSelected;
  final VoidCallback onTap;

  const _TimeSlot({
    required this.time,
    required this.primaryColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor.withOpacity(0.5)),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : primaryColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class _CalendarWidget extends StatelessWidget {
  final Color primaryColor;
  final Color accentColor;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const _CalendarWidget({
    required this.primaryColor,
    required this.accentColor,
    required this.selectedDate,
    required this.onDateSelected,
  });

  // Helper untuk mendapatkan jumlah hari dalam bulan
  int _daysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    // Tanggal 1 bulan ini
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    // Hari ke-berapa tanggal 1 itu jatuh (Sunday=0, Monday=1, ..., Saturday=6)
    final startWeekday = firstDayOfMonth.weekday % 7;
    final totalDays = _daysInMonth(selectedDate);

    // Total slot yang dibutuhkan dalam grid untuk bulan yang ditampilkan (maks 42 = 6 baris)
    final itemCount = 42;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: primaryColor, // Latar belakang hijau tua
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Navigasi Bulan/Tahun (2025)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM yyyy').format(selectedDate),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                    onPressed: () {
                      // Implementasi untuk bulan sebelumnya
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                    onPressed: () {
                      // Implementasi untuk bulan berikutnya
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Nama Hari
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map(
                  (day) => Center(
                    child: Text(
                      day,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 5),

          // Angka Tanggal
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final dayOfMonth = index - startWeekday + 1;

              // Cek apakah di luar rentang tanggal bulan ini
              if (dayOfMonth <= 0 || dayOfMonth > totalDays) {
                return Container();
              }

              final dayDateTime = DateTime(
                selectedDate.year,
                selectedDate.month,
                dayOfMonth,
              );

              // Logika ketersediaan disederhanakan (misal, semua hari tersedia)
              bool isAvailable = true;

              // Menentukan tanggal yang dipilih
              bool isSelected =
                  dayDateTime.day == selectedDate.day &&
                  dayDateTime.month == selectedDate.month &&
                  dayDateTime.year == selectedDate.year;

              return GestureDetector(
                onTap: isAvailable ? () => onDateSelected(dayDateTime) : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? accentColor : Colors.transparent,
                    shape: BoxShape.circle,
                    border: isAvailable && !isSelected
                        ? Border.all(color: Colors.white.withOpacity(0.3))
                        : null,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$dayOfMonth',
                    style: TextStyle(
                      color: isSelected ? primaryColor : Colors.white,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
