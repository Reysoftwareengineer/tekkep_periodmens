import 'package:flutter/material.dart';
import 'screens/calendar_ttd.dart';
import 'screens/education_screens.dart';
import 'screens/calender_screens.dart';
import 'screens/profil_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menstruation Tracker',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BottomNavBarScreen(),
    );
  }
}

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  BottomNavBarScreenState createState() => BottomNavBarScreenState();
}

class BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  // Daftar layar/tab
  final List<Widget> _screens = [
    const CalendarScreen(), // Kalender Menstruasi
    const CalendarTTDScreen(), // Kalender TTD
    const EducationScreen(), // Edukasi
    const ProfileScreen(), // Profil Pengguna
  ];

  // Judul dinamis untuk AppBar
  final List<String> _titles = [
    'Kalender Haid',
    'Kalender Tablet Tambah Darah',
    'Edukasi Menstruasi',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]), // Judul sesuai tab
        backgroundColor: Colors.pink.shade200,
        foregroundColor: Colors.white, // Menjadikan warna judul putih
      ),
      body: _screens[_currentIndex], // Tampilan layar berdasarkan tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.pink.shade200,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Kalender Haid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_day),
            label: 'Kalender TTD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Edukasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
