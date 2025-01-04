import 'package:flutter/material.dart';

class NutrisiHarusDikonsumsiPage extends StatelessWidget {
  const NutrisiHarusDikonsumsiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> nutrisiList = [
      {
        'title': 'Kunyit',
        'description': 'Meningkatkan produksi sel darah merah.',
        'image': 'assets/kunyit.jpg',
      },
      {
        'title': 'Jahe',
        'description': 'Mengurangi kram otot dan mendukung kesehatan tulang.',
        'image': 'assets/jahe.jpg',
      },
      {
        'title': 'Vitamin C',
        'description': 'Membantu mengatur hormon dan mengurangi nyeri.',
        'image': 'assets/vitaminc.jpg',
      },
      {
        'title': 'Nanas',
        'description': 'Mengurangi gejala PMS seperti perubahan suasana hati.',
        'image': 'assets/nanas.jpg',
      },
      {
        'title': 'Pepaya',
        'description': 'Mengurangi inflamasi dan nyeri menstruasi.',
        'image': 'assets/pepaya.jpg',
      },
      {
        'title': 'Kayu Manis',
        'description': 'Mendukung penyerapan kalsium dan kesehatan hormon.',
        'image': 'assets/kayumanis.jpg',
      },
      {
        'title': 'Teh Chamomile',
        'description': 'Membantu pencernaan dan menjaga keseimbangan hormon.',
        'image': 'assets/tehchamomile.jpg',
      },
    ];

    final List<Map<String, String>> notRecommendedList = [
      {
        'title': 'Makanan Tinggi Gula',
        'description':
            'Mengkonsumsi makanan tinggi gula seperti coklat dapat menyebabkan penurunan kadar gula darah, yang dapat memperlambat perubahan suasana hati dan kelelahan saat menstruasi.',
        'image': 'assets/makanantinggigula.png',
      },
      {
        'title': 'Makanan Tinggi Garam',
        'description':
            'Garam yang berlebihan dapat menyebabkan retensi udara, sehingga melemahkan kembung yang sering dialami saat menstruasi.',
        'image': 'assets/makanantinggigaram.png',
      },
      {
        'title': 'Makanan Berlemak',
        'description':
            'Lemak jenuh yang tinggi dalam makanan seperti gorengan atau daging merah dapat meningkatkan peradangan dan kram menstruasi.',
        'image': 'assets/makananberlemak.jpg',
      },
      {
        'title': 'Kafein',
        'description':
            'Kafein yang ada dalam kopi, teh, atau cokelat, dapat memperparah kram dan meningkatkan rasa cemas saat menstruasi.',
        'image': 'assets/kafein.png',
      },
      {
        'title': 'Makanan Olahan',
        'description':
            'Makanan olahan seperti mie dan kiripik seringkali tinggi garam, gula, dan bahan pengawet yang dapat memperburuk gejala menstruasi.',
        'image': 'assets/makananolahan.png',
      },
      {
        'title': 'Alkohol',
        'description':
            'Alkohol dapat menyebabkan tubuh kehilangan cairan dan memperburuk kram, dehidrasi, dan mengganggu tidur.',
        'image': 'assets/alkohol.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrisi yang Harus Dikonsumsi'),
        backgroundColor: Colors.pink[200], // Soft pink for consistency
        foregroundColor: Colors.white, // Menjadikan warna judul putih
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Text(
              'ASUPAN YANG DAPAT MELANCARKAN MENSTRUASI',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          ...nutrisiList.map((nutrisi) => Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Image.asset(
                    nutrisi['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    nutrisi['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    nutrisi['description']!,
                    textAlign: TextAlign.justify,
                  ),
                ),
              )),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'MAKANAN YANG TIDAK DIANJURKAN SAAT MENSTRUASI',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          ...notRecommendedList.map((item) => Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Image.asset(
                    item['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    item['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    item['description']!,
                    textAlign: TextAlign.justify,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
