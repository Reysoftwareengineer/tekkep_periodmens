import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Menyimpan data profil yang bisa diubah
  final TextEditingController _nameController =
      TextEditingController(text: 'John Doe');
  final TextEditingController _emailController =
      TextEditingController(text: 'john.doe@example.com');
  final TextEditingController _addressController =
      TextEditingController(text: 'Jl. Contoh Alamat, No. 123');
  final TextEditingController _phoneController =
      TextEditingController(text: '0812-3456-7890');

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

              const SizedBox(height: 30),

              // Tombol logout dengan warna soft pink
              ElevatedButton(
                onPressed: () {
                  // Logika untuk logout
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
              style: const TextStyle(
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
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
