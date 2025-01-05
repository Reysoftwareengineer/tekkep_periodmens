import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<String>> _events;
  DateTime _selectedDay = DateTime.now();
  DateTime? _startHaid;
  DateTime? _nextPredictionStart;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _events = {};
    _loadHaidData(); // Load haid data from Firestore on init
  }

  // Load haid data from Firestore
  Future<void> _loadHaidData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        var startHaidTimestamp = userData['startHaid'];
        if (startHaidTimestamp != null) {
          setState(() {
            _startHaid = DateTime.parse(startHaidTimestamp);
            _nextPredictionStart =
                DateTime.parse(userData['nextPredictionStart']);
            _loadEventsForHaidCycle();
          });
        }
      }
    }
  }

  // Load events for the haid cycle
  void _loadEventsForHaidCycle() {
    if (_startHaid != null) {
      setState(() {
        _events = {};
        for (int i = 0; i < 7; i++) {
          DateTime haidDay = _startHaid!.add(Duration(days: i));
          _events.update(haidDay, (existing) => ["Haid"],
              ifAbsent: () => ["Haid"]);
        }

        const int haidToFirstPredictionDuration = 30;
        const int subsequentPredictionsDuration = 38;

        _nextPredictionStart =
            _startHaid!.add(Duration(days: haidToFirstPredictionDuration));

        for (int i = 0; i < 6; i++) {
          DateTime predictedStart = _nextPredictionStart!
              .add(Duration(days: i * subsequentPredictionsDuration));
          for (int j = 0; j < 7; j++) {
            DateTime predictedDay = predictedStart.add(Duration(days: j));
            _events.update(predictedDay, (existing) => ["Prediksi Haid"],
                ifAbsent: () => ["Prediksi Haid"]);
          }
        }
      });
    }
  }

  // Save haid data to Firestore
  Future<void> _saveHaidData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'startHaid': _startHaid!.toIso8601String(),
        'nextPredictionStart': _nextPredictionStart!.toIso8601String(),
      }, SetOptions(merge: true));
    }
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _addHaidPeriod(DateTime start) {
    setState(() {
      _startHaid = start;
      _events.update(_startHaid!, (existing) => ["Haid"],
          ifAbsent: () => ["Haid"]);

      for (int i = 1; i <= 6; i++) {
        DateTime haidDay = _startHaid!.add(Duration(days: i));
        _events.update(haidDay, (existing) => ["Haid"],
            ifAbsent: () => ["Haid"]);
      }

      const int haidToFirstPredictionDuration = 30;
      const int subsequentPredictionsDuration = 38;

      _nextPredictionStart =
          _startHaid!.add(Duration(days: haidToFirstPredictionDuration));

      for (int i = 0; i < 6; i++) {
        DateTime predictedStart = _nextPredictionStart!
            .add(Duration(days: i * subsequentPredictionsDuration));
        for (int j = 0; j < 7; j++) {
          DateTime predictedDay = predictedStart.add(Duration(days: j));
          _events.update(predictedDay, (existing) => ["Prediksi Haid"],
              ifAbsent: () => ["Prediksi Haid"]);
        }
      }

      // Save data to Firestore
      _saveHaidData();
    });
  }

  bool _isHaidToday(DateTime date) {
    if (_startHaid == null) return false;
    return date.isAfter(_startHaid!.subtract(const Duration(days: 1))) &&
        date.isBefore(_startHaid!.add(const Duration(days: 7)));
  }

  bool _isWithinPredictedPeriod(DateTime date) {
    if (_startHaid == null) return false;
    for (int i = 0; i < 7; i++) {
      DateTime predictedStart =
          _nextPredictionStart!.add(Duration(days: i * 30));
      for (int j = 0; j < 7; j++) {
        DateTime predictedDay = predictedStart.add(Duration(days: j));
        if (isSameDay(date, predictedDay)) {
          return true;
        }
      }
    }
    return false;
  }

  int _getDayOfCycle(DateTime date) {
    return date.difference(_startHaid!).inDays + 1;
  }

  String _getNextHaidPrediction() {
    if (_nextPredictionStart == null) return 'Belum ada prediksi';
    return '${_nextPredictionStart!.day}/${_nextPredictionStart!.month}/${_nextPredictionStart!.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF8BBD0), Color(0xFFF48FB1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFF06292), Color(0xFFEC407A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Color(0xFFF06292),
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, _) {
                if (_startHaid != null &&
                    date.isAfter(
                        _startHaid!.subtract(const Duration(days: 1))) &&
                    date.isBefore(_startHaid!.add(const Duration(days: 7)))) {
                  if ((date.isAfter(_startHaid!))) {
                    return Center(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF48FB1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${date.day}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }
                } else if (_isWithinPredictedPeriod(date)) {
                  return Positioned(
                    bottom: 2,
                    child: Center(
                      child: DottedBorder(
                        color: const Color(0xFFF48FB1),
                        borderType: BorderType.Circle,
                        dashPattern: const [4, 3],
                        child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            '${date.day}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              DateTime? start = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                helpText: 'Pilih Tanggal Mulai Haid',
              );
              if (start != null) {
                _addHaidPeriod(start);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Tambah Haid",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (_startHaid != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: const Color(0xFFFFF1F3),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Siklus Haid',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFD81B60),
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (_isHaidToday(_selectedDay))
                        Text(
                          'Hari ini adalah hari ke-${_getDayOfCycle(_selectedDay)} dari 7 hari haid!',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFFC2185B),
                          ),
                        )
                      else if (_isWithinPredictedPeriod(_selectedDay))
                        Text(
                          'Prediksi haid selanjutnya pada: ${_getNextHaidPrediction()}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF880E4F),
                          ),
                        )
                      else
                        Text(
                          'Haid berikutnya akan terjadi dalam ${_nextPredictionStart!.difference(_selectedDay).inDays} hari.',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFFC2185B),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
