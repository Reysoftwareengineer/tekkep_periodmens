import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CalendarTTDScreen extends StatefulWidget {
  const CalendarTTDScreen({super.key});

  @override
  _CalendarTTDScreenState createState() => _CalendarTTDScreenState();
}

class _CalendarTTDScreenState extends State<CalendarTTDScreen> {
  late Map<DateTime, List<String>> _events;
  DateTime _selectedDay = DateTime.now();
  DateTime? _startHaid;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _events = {};
    _loadHaidData(); // Load data from Firestore
  }

  // Load stored startHaid data from Firestore
  Future<void> _loadHaidData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (snapshot.exists) {
        var userData = snapshot.data() as Map<String, dynamic>;
        var startHaidTimestamp = userData['startTablet'];
        if (startHaidTimestamp != null) {
          setState(() {
            _startHaid = DateTime.parse(startHaidTimestamp);
            _loadEventsForHaidCycle();
          });
        }
      }
    }
  }

  // Save the startHaid to Firestore
  Future<void> _saveHaidData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
        {
          'startTablet': _startHaid!.toIso8601String(),
        },
        SetOptions(
            merge: true), // Merge data so we don't overwrite other fields
      );
    }
  }

  // Add haid period and update events
  void _addHaidPeriod(DateTime start) {
    setState(() {
      _startHaid = start;
      _events.update(_startHaid!, (existing) => ["Haid"],
          ifAbsent: () => ["Haid"]);
      for (int i = 1; i <= 4; i++) {
        DateTime predictedStart = _startHaid!.add(Duration(days: i * 7));
        _events.update(predictedStart, (existing) => ["Prediksi Haid"],
            ifAbsent: () => ["Prediksi Haid"]);
      }
      _saveHaidData(); // Save to Firestore after updating the event
    });
  }

  void _loadEventsForHaidCycle() {
    if (_startHaid != null) {
      for (int i = 0; i <= 4; i++) {
        DateTime predictedStart = _startHaid!.add(Duration(days: i * 7));
        _events.update(predictedStart, (existing) => ["Prediksi Haid"],
            ifAbsent: () => ["Prediksi Haid"]);
      }
    }
  }

  bool _isWithinPredictedPeriod(DateTime date) {
    if (_startHaid == null) return false;
    for (int i = 1; i <= 240; i++) {
      DateTime predictedStart = _startHaid!.add(Duration(days: i * 7));
      if (isSameDay(date, predictedStart)) {
        return true;
      }
    }
    return false;
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
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
                if (_startHaid != null && isSameDay(date, _startHaid!)) {
                  return Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF8BBD0),
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
                } else if (_isWithinPredictedPeriod(date)) {
                  return Center(
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
                helpText: 'Pilih Tanggal Minum Tablet',
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
              "Tambah Tablet",
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
                        'Informasi Minum Tablet!',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFD81B60),
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (isSameDay(_selectedDay, _startHaid!))
                        Text(
                          'Waktunya minum tablet hari ini!',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFFC2185B),
                          ),
                        )
                      else if (_selectedDay.isAfter(_startHaid!))
                        Text(
                          'Mendekati waktu minum tablet.',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFFC2185B),
                          ),
                        )
                      else
                        Text(
                          'Minum tablet dalam ${_startHaid!.difference(_selectedDay).inDays} hari.',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFFC2185B),
                          ),
                        ),
                      const SizedBox(height: 8),
                      if (_startHaid != null)
                        Text(
                          'Minum tablet selanjutnya dalam ${(7 - (_selectedDay.difference(_startHaid!).inDays % 7)) % 7} hari.',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF880E4F),
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
