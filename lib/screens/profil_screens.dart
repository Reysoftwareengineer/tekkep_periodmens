import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tambahkan dependensi intl untuk format tanggal
import 'package:google_fonts/google_fonts.dart'; // Import google fonts
import 'infoapk.dart'; // Import the InfoAPKScreen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Menyimpan data profil yang bisa diubah
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Mendapatkan data pengguna dari Firestore
  Future<void> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Mengambil data pengguna berdasarkan uid
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        setState(() {
          _nameController.text = userData['name'] ?? 'Nama Tidak Ditemukan';
          _emailController.text = userData['email'] ?? 'Email Tidak Ditemukan';
          _addressController.text =
              userData['address'] ?? 'Alamat Tidak Ditemukan';
          _phoneController.text = userData['phone'] ?? 'Nomor Tidak Ditemukan';
          _ageController.text = userData['age'] ?? 'Umur Tidak Ditemukan';
        });
      }
    }
  }

  // Fungsi untuk menghitung usia dari tanggal lahir
  void _calculateAge(String birthDate) {
    DateTime birthDateTime = DateFormat('yyyy-MM-dd')
        .parse(birthDate); // Asumsikan format tanggal di Firestore: yyyy-MM-dd
    DateTime currentDate = DateTime.now();

    int age = currentDate.year - birthDateTime.year;
    if (currentDate.month < birthDateTime.month ||
        (currentDate.month == birthDateTime.month &&
            currentDate.day < birthDateTime.day)) {
      age--;
    }

    _ageController.text = '$age tahun'; // Menambahkan "tahun" pada usia
  }

  @override
  void initState() {
    super.initState();
    _getUserData(); // Mengambil data pengguna ketika halaman pertama kali dibuka
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar profil di atas
              CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage(
                    'assets/user.png'), // Ganti dengan gambar profil Anda
                backgroundColor: Colors.pink.shade100,
              ),
              const SizedBox(height: 20),

              const Text(
                'Profil Pengguna',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Detail Profil di dalam Box yang lebih sederhana
              _buildProfileDetail('Nama Pengguna', _nameController),
              _buildProfileDetail('Email', _emailController),
              _buildProfileDetail('Alamat', _addressController),
              _buildProfileDetail('Nomor HP', _phoneController),
              _buildProfileDetail('Usia', _ageController), // Kotak untuk usia

              const SizedBox(height: 30),

              // Tombol logout dengan warna soft pink
              ElevatedButton(
                onPressed: () {
                  // Logika untuk logout
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat detail profil yang lebih simpel dan modern
  Widget _buildProfileDetail(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity, // Kotak menyesuaikan lebar
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.pink.shade200),
          color: Colors.pink.shade50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.lato(
                // Menggunakan Google Fonts
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 180,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none, // Menghilangkan border tambahan
                  hintText: 'Masukkan $label',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                ),
                style: GoogleFonts.poppins(
                  // Menggunakan Google Fonts pada TextFormField
                  fontSize: 15,
                ),
                readOnly: true, // Membaca data, tidak bisa diubah
              ),
            ),
          ],
        ),
      ),
    );
  }
}
