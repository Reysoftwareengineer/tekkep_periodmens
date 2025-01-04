import 'package:flutter/material.dart';

class ArtiWarnaKeputihanPage extends StatelessWidget {
  const ArtiWarnaKeputihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arti Warna Keputihan'),
        backgroundColor: Colors.pink[200], // Soft pink for consistency
        foregroundColor: Colors.white, // Menjadikan warna judul putih
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Gambar di bagian atas
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center align the images
            children: [
              _buildImageBox('assets/Picture3a.jpg'),
              const SizedBox(width: 16.0),
              _buildImageBox('assets/Picture3b.jpg'),
            ],
          ),
          const SizedBox(height: 24.0),

          // Isi penjelasan
          const Text(
            '1. Putih',
            style: TextStyle(fontSize: 18, color: Colors.pink),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Keputihan yang berwarna putih bening dengan tekstur encer atau sedikit kental merupakan keputihan yang normal dan sehat. Namun, jika jumlahnya berlebihan dan menimbulkan rasa gatal, berwarna putih susu, serta berbau, keputihan ini biasanya menandakan adanya infeksi jamur di vagina.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),

          const Text(
            '2. Cokelat Kemerah (Flek)',
            style: TextStyle(fontSize: 18, color: Colors.pink),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Keputihan ini dapat disebabkan oleh berbagai kondisi, seperti siklus menstruasi yang tidak teratur, pendarahan implantasi, tanda awal haid. Beberapa kondisi juga bisa menyebabkan keputihan menjadi cokelat kemerahan, seperti infeksi atau kanker serviks. Wanita yang mengalami kondisi ini cenderung merasakan keluhan lain, seperti kram perut, gatal di vagina, demam, atau nyeri panggul.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),

          const Text(
            '3. Merah muda',
            style: TextStyle(fontSize: 18, color: Colors.pink),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Umumnya dapat terjadi pada awal atau akhir menstruasi. Warna keputihan ini bisa disebabkan oleh darah haid yang bercampur dengan lendir dari kelenjar di vagina.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),

          const Text(
            '4. Kuning atau hijau',
            style: TextStyle(fontSize: 18, color: Colors.pink),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Infeksi menular seksual, seperti trikomoniasis, gonore, dan klamidia, bisa menyebabkan keluarnya keputihan yang berwarna kuning atau hijau dari vagina. Kondisi ini juga dapat disertai dengan gejala lain berupa nyeri saat buang air kecil, vagina berbau tidak sedap, dan nyeri panggul.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),

          const Text(
            '5. Abu-abu',
            style: TextStyle(fontSize: 18, color: Colors.pink),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Warna keputihan abu-abu merupakan tanda bahwa vagina sedang menderita infeksi bakteri (vaginosis bakterialis). Hal ini biasanya terjadi akibat terganggunya keseimbangan bakteri baik di vagina, sehingga menyebabkan munculnya keluhan keputihan yang berwarna abu-abu.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24.0),

          // Judul baru
          const Text(
            'Arti Warna Darah Menstruasi',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
          ),
          const SizedBox(height: 16.0),

          // Gambar baru di bawah judul
          _buildImageBox('assets/Picture3c.jpg'),

          const SizedBox(height: 24.0),

          // Penjelasan tambahan
          const Text(
            '1. Darah Hitam',
            style: TextStyle(fontSize: 18, color: Colors.pink),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Jangan panik jika darah menstruasi tiba-tiba berwarna kehitaman. Darah haid hitam juga bisa menjadi tanda bahwa siklus menstruasi akan segera berakhir. Darah haid berwarna hitam merupakan darah lama alias darah haid yang tersisa, mungkin dari bulan sebelumnya. Darah haid berwarna hitam juga dapat menandakan adanya penyumbatan di dalam vagina. Ini biasanya terjadi ketika darah terperangkap dan teroksidasi, membuatnya berubah menjadi warna hitam. Umumnya bukan kondisi yang berbahaya dan sering kali dianggap normal, terutama jika muncul pada awal atau akhir menstruasi. Ini terjadi karena darah yang mengalir lebih lambat mengalami oksidasi, sehingga warnanya berubah menjadi gelap.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16.0),
          // ... (lanjutan konten Anda tetap sama seperti sebelumnya)
        ],
      ),
    );
  }

  // Widget untuk membuat kotak gambar
  Widget _buildImageBox(String imagePath) {
    return Container(
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
          imagePath,
          fit: BoxFit.contain, // Menjaga gambar tetap utuh tanpa terpotong
          height: 150,
        ),
      ),
    );
  }
}
