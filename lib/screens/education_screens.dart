import 'package:flutter/material.dart';
import 'kebersihan_area_kewanitaan_page.dart';
import 'cara_pemasangan_pembalut_page.dart';
import 'penjelasan_darah_menstruasi_page.dart';
import 'nutrisi_harus_dikonsumsi_page.dart';
import 'cara_bersuci_page.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: ListView(
          children: [
            _buildMenuItem(
              context,
              icon: Icons.cleaning_services,
              title: 'Kebersihan Area Kewanitaan',
              page: const KebersihanAreaKewanitaanPage(),
            ),
            _buildMenuItem(
              context,
              icon: Icons.health_and_safety,
              title: 'Cara Pemasangan Pembalut',
              page: const CaraPemasanganPembalutPage(),
            ),
            _buildMenuItem(
              context,
              icon: Icons.bloodtype,
              title: 'Penjelasan Darah Menstruasi',
              page: const ArtiWarnaKeputihanPage(),
            ),
            _buildMenuItem(
              context,
              icon: Icons.restaurant_menu,
              title: 'Nutrisi yang Harus Dikonsumsi',
              page: const NutrisiHarusDikonsumsiPage(),
            ),
            _buildMenuItem(
              context,
              icon: Icons.wash,
              title: 'Cara Bersuci',
              page: const CaraBersuciPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon, required String title, required Widget page}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 36, color: Colors.blueAccent),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
