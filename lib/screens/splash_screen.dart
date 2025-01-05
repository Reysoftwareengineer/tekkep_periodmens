import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Animasi akan berulang bolak-balik.

    // Animasi rotasi kecil untuk goyangan
    _rotationAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Timer untuk navigasi ke halaman utama
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        context,
        '/login', // Route tujuan ke halaman utama
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Membersihkan controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 164, 195), // Pink soft
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value, // Rotasi kecil kanan-kiri
                  child: Image.asset(
                    'assets/icon_app.png', // Path logo Anda
                    height: 170.0,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            // Menampilkan nama aplikasi dengan Google Fonts
            Text(
              'FemCycle',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Warna tulisan putih
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
