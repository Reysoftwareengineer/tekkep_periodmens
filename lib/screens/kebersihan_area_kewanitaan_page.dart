import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import untuk Google Fonts

class KebersihanAreaKewanitaanPage extends StatelessWidget {
  const KebersihanAreaKewanitaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kebersihan Area Kewanitaan',
          style: GoogleFonts.poppins(
            // Gunakan Google Fonts untuk AppBar
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink[200], // Soft Pink Color
        foregroundColor: Colors.white, // Menjadikan warna judul putih
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Judul untuk kebersihan area kewanitaan sehari-hari
            Text(
              'Cara menjaga kebersihan area kewanitaan sehari-hari:',
              style: GoogleFonts.poppins(
                // Gunakan Google Fonts untuk teks
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink[300], // Soft Pink Accent
              ),
            ),
            const SizedBox(height: 16),

            // Membuat list item dengan Card
            _buildListItem(
              icon: Icons.cleaning_services,
              title: '1. Bersihkan Vagina Secara Rutin.',
              description:
                  'Basuh vagina setiap kali setelah buang air kecil atau besar. Pastikan untuk membersihkannya dari arah depan ke belakang untuk mencegah perpindahan bakteri dari anus ke vagina.',
            ),
            _buildListItem(
              icon: Icons.soap,
              title: '2. Gunakan Sabun yang Tepat.',
              description:
                  'Hindari penggunaan sabun beraroma atau pembersih yang dapat mengganggu keseimbangan pH vagina. Gunakan air hangat untuk membersihkan area luar vagina.',
            ),
            _buildListItem(
              icon: Icons.check_circle,
              title: '3. Pilih Pakaian Dalam yang Nyaman.',
              description:
                  'Kenakan celana dalam berbahan katun yang memungkinkan sirkulasi udara yang baik. Hindari celana dalam ketat dan bahan sintetis yang dapat menyebabkan kelembapan berlebih.',
            ),
            _buildListItem(
              icon: Icons.restore_from_trash,
              title: '4. Ganti Pakaian Basah Segera.',
              description:
                  'Setelah berolahraga atau berenang, segera ganti pakaian basah untuk mencegah pertumbuhan bakteri.',
            ),
            _buildListItem(
              icon: Icons.balance,
              title: '5. Menjaga Keseimbangan pH.',
              description:
                  'Jangan menggunakan produk pembersih kewanitaan secara berlebihan, karena dapat mengganggu keseimbangan pH alami vagina.',
            ),
            _buildListItem(
              icon: Icons.security,
              title: '6. Berhubungan Seks dengan Aman.',
              description:
                  'Gunakan pelindung seperti kondom saat berhubungan seksual untuk mencegah infeksi dan penyakit menular seksual.',
            ),

            const SizedBox(height: 24),

            // Judul untuk kebersihan area kewanitaan saat menstruasi
            Text(
              'Cara menjaga kebersihan area kewanitaan saat menstruasi:',
              style: GoogleFonts.poppins(
                // Gunakan Google Fonts untuk teks
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.pink[300], // Soft Pink Accent
              ),
            ),
            const SizedBox(height: 16),

            // Membuat list item dengan Card untuk menstruasi
            _buildListItem(
              icon: Icons.refresh,
              title: '1. Ganti pembalut secara teratur setiap 4-6 jam sekali.',
              description:
                  'Disarankan untuk mengganti pembalut secara teratur setiap 4-6 jam sekali. Frekuensi ini dapat disesuaikan dengan banyaknya aliran darah haid.',
            ),
            _buildListItem(
              icon: Icons.check_box,
              title: '2. Menggunakan pembalut yang sesuai.',
              description:
                  'Pilihlah jenis pembalut yang sesuai dengan tingkat aliran darah menstruasi. Gunakan pembalut dengan daya serap yang cukup untuk menghindari kebocoran.',
            ),
            _buildListItem(
              icon: Icons.wash,
              title:
                  '3. Membersihkan organ intim terlebih dahulu sebelum mengganti pembalut.',
              description:
                  'Bersihkan area kewanitaan dengan air bersih, kemudian bilas dari depan ke belakang, dan keringkan dengan tisu atau kain bersih.',
            ),
            _buildListItem(
              icon: Icons.local_pharmacy,
              title:
                  '4. Hindari penggunaan sabun yang mengandung parfum atau bahan kimia keras.',
              description:
                  'Pilih sabun yang lembut dan diformulasikan khusus untuk area kewanitaan dengan pH seimbang (5.0-5.5).',
            ),
            _buildListItem(
              icon: Icons.change_history,
              title: '5. Rutin mengganti celana dalam.',
              description:
                  'Gunakan celana dalam yang terbuat dari bahan yang menyerap keringat seperti katun, dan tidak terlalu ketat.',
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat item dengan card style
  Widget _buildListItem(
      {required IconData icon,
      required String title,
      required String description}) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.pink[50], // Soft Pink Background
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.pink[400], // Soft Pink Accent
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      // Gunakan Google Fonts untuk teks
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent, // Soft Pink Color for Title
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    textAlign: TextAlign.justify, // Justify the text
                    style: GoogleFonts.poppins(
                      // Gunakan Google Fonts untuk teks
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
