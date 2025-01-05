import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaraBersuciPage extends StatelessWidget {
  const CaraBersuciPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cara Bersuci',
          style: GoogleFonts.poppins(
            // Using the 'Lato' Google font
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink[200],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Membungkus seluruh body dengan SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Penjelasan pertama
            const Text(
              'Seorang wanita yang telah kedatangan bulan (menstruasi) kemudian setelah melalui beberapa waktu darah haidnya terhenti (tidak keluar lagi), maka baginya wajib melakukan mandi (besar). Begitu pula apabila seorang wanita yang telah melahirkan, dan setelah ± 40 hari darahnya berhenti, maka baginya wajib melakukan mandi (besar). \n\n'
              'Hal ini didasarkan pada hadis Nabi SAW yang disampaikan kepada Aisyah RA.',
              textAlign: TextAlign.justify, // Menjadikan teks rata kanan-kiri
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            // Kotak gambar pertama
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/doacarabersuci.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Teks hadis pertama
            const Text(
              'Nabi SAW bersabda: Apabila datang bulan, maka tinggalkanlah salat dan apabila darah haid telah selesai, maka mandilah dan salatlah”. (H.R. al Bukhari)',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan tentang tata cara mandi besar
            const Center(
              child: Text(
                'Tata Cara (Kaifiyat) Mandi Besar',
                textAlign: TextAlign.center, // Rata tengah
                style: TextStyle(
                  fontSize: 20, // Ukuran font lebih besar untuk judul
                  fontWeight: FontWeight.bold, // Membuat teks tebal
                ),
              ),
            ),
            const SizedBox(
                height: 8.0), // Jarak antara judul dan konten berikutnya
            const Text(
              '1. Niat ikhlas karena Allah SWT',
              style: TextStyle(fontSize: 16), // Konten dengan ukuran standar
            ),
            const SizedBox(height: 16.0),

            // Kotak gambar kedua
            Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: 95.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat1.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan kedua dengan hadis
            const Text(
              'Dari Umar Ibnu Khattab r.a. saat ia diatas mimbar, ia berkata: "Aku telah mendengar Rasulullah bersabda; "Sesungguhnya semua pekerjaan itu disertai dengan niyatnya"',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 2
            const Text(
              '2. Membasuh/mencuci kedua telapak tangan, dilakukan sambil membersihkan sela-sela jari tangan',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            // Kotak gambar ketiga
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat2a.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Kotak gambar keempat
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 58.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat2b.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan hadis dari Maimunah
            const Text(
              'Dari Maimunah isteri Nabi SAW, ia berkata: Rasulullah saw berwudlu seperti wudlunya untuk shalat kecuali (membasuh) kaki,',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 3
            const Text(
              '3. Membersihkan kemaluan dengan tangan kiri, dan menggosokkan tangan pada tanah atau sejenisnya (ex. Sabun)',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            // Kotak gambar kelima
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat3.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan tentang langkah selanjutnya
            const Text(
              'Kemudian beliau menuangkan air pada kemaluannya dan membasuhnya dengan tangan kirinya, lalu digosokkan tangannya pada tanah',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 4
            const Text(
              '4. Berwudhu seperti berwudhu untuk salat',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            // Kotak gambar keenam
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat4.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan hadis Aisyah
            const Text(
              'Dari ‘Aisyah r.a. bahwa Nabi saw , kalau beliau mandi karena junub, ia mulai membasuh kedua tangannya, kemudian menuangkan dengan (tangan) kanannya pada kirinya, lalu mencuci kemaluannya, lalu berwudhu seperti wudhunya untuk salat; kemudian mengambil air dan memasukkan jari-jarinya di pangkal rambutnya sehingga apabila ia merasa bahwa sudah merata, ia menyiramkan air untuk kepalanya tiga tuangan, lalu meratakan seluruh badannya; kemudian membasuh kedua kakinya.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),

            // Kotak gambar setelah Aisyah
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat4a.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Kotak gambar tambahan
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 40.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat4b.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan Maimunah
            const Text(
              'Dari Maimunah isteri Nabi SAW, ia berkata: Rasulullah saw berwudlu seperti wudlunya untuk shalat kecuali (membasuh) kaki,',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 5
            const Text(
              '5. Kemudian menuangkan air ke atas kepala dengan memakai wangi-wangian, memasukkan jari-jari tangan pada pokok (pangkal) rambut menggosok gosoknya, meratakan seluruh badan dimulai dari sisi kanan kemudian sisi kiri dengan digosok, dan menuangkan air sampai merata tiga kali',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            // Kotak gambar ketujuh
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat5a.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan hadis Aisyah tentang kepala
            const Text(
              'Dari ‘Aisyah : "Bahwa Nabi saw, jika beliau mandi karena Janabah, beliau minta suatu wadah, (seperti ember) lalu mengambil air dengan telapak tangannya dan memulai dari sisi kepalanya yang sebelah kanan, lalu yang sebelah kiri, lalu mengambil air dengan kedua telapak tangannya, maka ia membasuh kepalanya dengan keduanya".',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan langkah 6
            const Text(
              '6. Melepaskan ikatan rambut atau cukup menyiramnya',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            // Kotak gambar untuk langkah 6
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat6.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan hadis terkait melepaskan ikatan rambut
            const Text(
              'Bahwa Nabi saw, bersabda kepadanya, padahal dia sedang haid: "Lepaskanlah rambutmu dan mandilah".',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 7
            const Text(
              '7. Membasuh kedua kaki masing-masing tiga kali dengan mendahulukan kaki kanan',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            // Kotak gambar untuk langkah 7
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat7b.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 7
            const Text(
              '“Dari ‘Aisyah r.a. bahwa Nabi saw , kalau beliau mandi karena junub, ia mulai membasuh kedua tangannya, kemudian menuangkan dengan (tangan) kanannya pada kirinya, lalu mencuci kemaluannya, lalu berwudhu seperti wudhunya untuk salat; kemudian mengambil air dan memasukkan jari-jarinya di pangkal rambutnya sehingga apabila ia merasa bahwa sudah merata, ia menyiramkan air untuk kepalanya tiga tuangan, lalu meratakan seluruh badannya; kemudian membasuh kedua kakinya.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat7b.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            const Text(
              '“Dari ‘Aisyah ia berkata bahwa Rasulullah s.a.w suka mendahulukan (yang) kanannya, dalam memakai sandalnya, bersisirnya, bersucinya dan dalam segala hal-nya”.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            const Text(
              '8.	Tidak berlebih-lebihan dalam menggunakan air',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),

            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat8.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            const Text(
              '“Dari Ibnu Jabir, ia berkata: saya mendengar Anas berkata: Adalah Nabi saw, mandi dengan satu sha’ (± 3 liter) sampai lima mud dan wudhu dengan satu mud (± ¾ liter)”',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
