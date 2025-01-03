import 'package:flutter/material.dart';

class CaraBersuciPage extends StatelessWidget {
  const CaraBersuciPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cara Bersuci'),
      ),
      body: SingleChildScrollView(
        // Membungkus seluruh body dengan SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Penjelasan pertama
            Text(
              'Seorang wanita yang telah kedatangan bulan (menstruasi) kemudian setelah melalui beberapa waktu darah haidnya terhenti (tidak keluar lagi), maka baginya wajib melakukan mandi (besar). Begitu pula apabila seorang wanita yang telah melahirkan, dan setelah ± 40 hari darahnya berhenti, maka baginya wajib melakukan mandi (besar). \n\n'
              'Hal ini didasarkan pada hadis Nabi SAW yang disampaikan kepada Aisyah RA.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),

            // Kotak gambar pertama
            Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/doacarabersuci.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Teks hadis pertama
            Text(
              'Nabi SAW bersabda: Apabila datang bulan, maka tinggalkanlah salat dan apabila darah haid telah selesai, maka mandilah dan salatlah”. (H.R. al Bukhari)',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),

            // Penjelasan tentang tata cara mandi besar
            Text(
              'Tata Cara (Kaifiyat) Mandi Besar\n1. Niat ikhlas karena Allah SWT',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),

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
            SizedBox(height: 16.0),

            // Penjelasan kedua dengan hadis
            Text(
              'Dari Umar Ibnu Khattab r.a. saat ia diatas mimbar, ia berkata: "Aku telah mendengar Rasulullah bersabda; "Sesungguhnya semua pekerjaan itu disertai dengan niyatnya"',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 2
            Text(
              '2. Membasuh/mencuci kedua telapak tangan, dilakukan sambil membersihkan sela-sela jari tangan',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),

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
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat2b.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Penjelasan hadis dari Maimunah
            Text(
              'Dari Maimunah isteri Nabi SAW, ia berkata: Rasulullah saw berwudlu seperti wudlunya untuk shalat kecuali (membasuh) kaki,',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 3
            Text(
              '3. Membersihkan kemaluan dengan tangan kiri, dan menggosokkan tangan pada tanah atau sejenisnya (ex. Sabun)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),

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
            SizedBox(height: 16.0),

            // Penjelasan tentang langkah selanjutnya
            Text(
              'Kemudian beliau menuangkan air pada kemaluannya dan membasuhnya dengan tangan kirinya, lalu digosokkan tangannya pada tanah',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 4
            Text(
              '4. Berwudhu seperti berwudhu untuk salat',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),

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
            SizedBox(height: 16.0),

            // Penjelasan hadis Aisyah
            Text(
              'Dari ‘Aisyah r.a. bahwa Nabi saw , kalau beliau mandi karena junub, ia mulai membasuh kedua tangannya, kemudian menuangkan dengan (tangan) kanannya pada kirinya, lalu mencuci kemaluannya, lalu berwudhu seperti wudhunya untuk salat; kemudian mengambil air dan memasukkan jari-jarinya di pangkal rambutnya sehingga apabila ia merasa bahwa sudah merata, ia menyiramkan air untuk kepalanya tiga tuangan, lalu meratakan seluruh badannya; kemudian membasuh kedua kakinya.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),

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
            SizedBox(height: 16.0),

            // Kotak gambar tambahan
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat4b.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Penjelasan Maimunah
            Text(
              'Dari Maimunah isteri Nabi SAW, ia berkata: Rasulullah saw berwudlu seperti wudlunya untuk shalat kecuali (membasuh) kaki,',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),

            // Penjelasan langkah mandi besar 5
            Text(
              '5. Kemudian menuangkan air ke atas kepala dengan memakai wangi-wangian, memasukkan jari-jari tangan pada pokok (pangkal) rambut menggosok gosoknya, meratakan seluruh badan dimulai dari sisi kanan kemudian sisi kiri dengan digosok, dan menuangkan air sampai merata tiga kali',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),

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
            SizedBox(height: 16.0),

            // Penjelasan hadis Aisyah tentang kepala
            Text(
              'Dari ‘Aisyah : "Bahwa Nabi saw, jika beliau mandi karena Janabah, beliau minta suatu wadah, (seperti ember) lalu mengambil air dengan telapak tangannya dan memulai dari sisi kepalanya yang sebelah kanan, lalu yang sebelah kiri, lalu mengambil air dengan kedua telapak tangannya, maka ia membasuh kepalanya dengan keduanya".',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),

            // Penjelasan langkah 6
            Text(
              '6. Melepaskan ikatan rambut atau cukup menyiramnya',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),

            // Kotak gambar untuk langkah 6
            Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: 120.0,
              child: Center(
                child: Image.asset(
                  'assets/kifayat6.png', // Ganti dengan nama file gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Penjelasan hadis terkait melepaskan ikatan rambut
            Text(
              'Bahwa Nabi saw, bersabda kepadanya, padahal dia sedang haid: "Lepaskanlah rambutmu dan mandilah".',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
