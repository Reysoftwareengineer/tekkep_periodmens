import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import untuk Google Fonts

class CaraPemasanganPembalutPage extends StatelessWidget {
  const CaraPemasanganPembalutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cara Pemasangan Pembalut',
          style: GoogleFonts.poppins(
            // Gunakan Google Fonts untuk AppBar
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        backgroundColor: Colors.pink[200],
        foregroundColor: Colors.white, // Menjadikan warna judul putih
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Gambar di bagian atas
          Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'assets/Picture2.jpg',
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Langkah-langkah yang benar untuk memasang pembalut:',
              style: GoogleFonts.poppins(
                // Gunakan Google Fonts untuk teks
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ),
          ..._buildSteps(),

          const Divider(height: 40, thickness: 1),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Tips Memilih Pembalut yang Tepat:',
              style: GoogleFonts.poppins(
                // Gunakan Google Fonts untuk teks
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ),
          ..._buildTips(),

          const Divider(height: 40, thickness: 1),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Tips Penggunaan Pembalut yang Sehat:',
              style: GoogleFonts.poppins(
                // Gunakan Google Fonts untuk teks
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
          ),
          ..._buildUsageTips(),
        ],
      ),
    );
  }

  // Langkah-langkah memasang pembalut
  List<Widget> _buildSteps() {
    final steps = [
      'Cuci tangan sebelum membuka kemasan pembalut.',
      'Buka kemasan dan lepaskan lapisan pelindung dari sisi perekat.',
      'Tempelkan pembalut di tengah celana dalam, pastikan posisinya tepat.',
      'Jika menggunakan pembalut bersayap, lepaskan lapisan pelindung sayap dan rekatkan sayap ke bagian luar celana dalam untuk mencegah pergeseran.',
      'Kenakan celana dalam seperti biasa dan pastikan pembalut nyaman dan tidak terlipat.',
    ];

    return List.generate(
      steps.length,
      (index) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.pink[300],
          child: Text(
            '${index + 1}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Align(
          alignment: Alignment.centerLeft, // Pastikan teks berada di kiri
          child: Text(
            steps[index],
            textAlign: TextAlign.justify, // Rata kanan-kiri
            style: GoogleFonts.poppins(
              // Gunakan Google Fonts untuk teks
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // Tips memilih pembalut
  List<Widget> _buildTips() {
    final tips = [
      'Pembalut tersedia dalam berbagai ukuran dan ketebalan, tergantung pada kebutuhan individu dan intensitas aliran menstruasi.',
      'Untuk intensitas aliran ringan hingga sedang, pembalut yang lebih tipis atau biasa mungkin sudah cukup.',
      'Untuk intensitas aliran yang lebih deras atau untuk penggunaan malam hari, pembalut yang lebih tebal atau panjang mungkin lebih cocok.',
    ];
    return List.generate(
      tips.length,
      (index) => ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.pink),
        title: Align(
          alignment: Alignment.centerLeft, // Pastikan teks dimulai dari kiri
          child: Text(
            tips[index],
            textAlign: TextAlign.justify, // Rata kanan-kiri
            style: GoogleFonts.poppins(
              // Gunakan Google Fonts untuk teks
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // Tips penggunaan pembalut
  List<Widget> _buildUsageTips() {
    final usageTips = [
      'Gantilah pembalut setiap 4-6 jam atau lebih sering jika intensitas aliran darah sangat deras.',
      'Pada malam hari, gunakan pembalut khusus malam yang lebih panjang dan lebih tebal untuk perlindungan yang lebih baik selama tidur.',
      'Gunakan pembalut yang tidak mengandung pewangi atau bahan kimia yang dapat menyebabkan iritasi kulit.',
      'Jika kulit di sekitar area genital mengalami iritasi, gatal, atau ruam, segera hentikan penggunaan dan konsultasikan dengan dokter.',
    ];
    return List.generate(
      usageTips.length,
      (index) => ListTile(
        leading: const Icon(Icons.check_circle_outline, color: Colors.pink),
        title: Align(
          alignment: Alignment.centerLeft, // Pastikan teks dimulai dari kiri
          child: Text(
            usageTips[index],
            textAlign: TextAlign.justify, // Rata kanan-kiri
            style: GoogleFonts.poppins(
              // Gunakan Google Fonts untuk teks
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
