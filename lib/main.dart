import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import untuk Google Fonts
import 'package:firebase_core/firebase_core.dart'; // Import Firebase
import 'screens/calendar_ttd.dart';
import 'screens/education_screens.dart';
import 'screens/calender_screens.dart';
import 'screens/profil_screens.dart';
import 'screens/splash_screen.dart'; // Import SplashScreen Anda
import 'screens/signup.dart';
import 'screens/login.dart';
import 'screens/infoapk.dart'; // Import the new InfoAPKScreen

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FemCycle',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // SplashScreen sebagai halaman awal
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const BottomNavBarScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/info': (context) =>
            const InfoAPKScreen(), // Add the InfoAPKScreen route
      },
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
    'Kalender Tablet Darah',
    'Edukasi Menstruasi',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex], // Judul sesuai tab
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ), // Menggunakan font Google Fonts
        backgroundColor: Colors.pink.shade200,
        foregroundColor: Colors.white, // Menjadikan warna judul putih
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              // Navigating to InfoAPKScreen when the icon is tapped
              Navigator.pushNamed(context, '/info');
            },
          ),
        ],
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
