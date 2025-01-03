import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dotted_border/dotted_border.dart'; // Add this package to your pubspec.yaml

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
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _addHaidPeriod(DateTime start) {
    setState(() {
      _startHaid = start;

      // Add event for the start date
      _events.update(_startHaid!, (existing) => ["Haid"],
          ifAbsent: () => ["Haid"]);

      // Predict the next 4 cycles, adding an event for each predicted start date
      for (int i = 1; i <= 4; i++) {
        DateTime predictedStart = _startHaid!
            .add(Duration(days: i * 7)); // Increment by 7 days per week
        _events.update(predictedStart, (existing) => ["Prediksi Haid"],
            ifAbsent: () => ["Prediksi Haid"]);
      }
    });
  }

  bool _isWithinPredictedPeriod(DateTime date) {
    if (_startHaid == null) return false;

    for (int i = 1; i <= 240; i++) {
      DateTime predictedStart = _startHaid!
          .add(Duration(days: i * 7)); // Calculate weekly predictions
      if (isSameDay(date, predictedStart)) {
        return true;
      }
    }
    return false;
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
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, _) {
                // Show solid light pink circle on the start date
                if (_startHaid != null && isSameDay(date, _startHaid!)) {
                  return Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            Colors.pink[200], // Lighter pink for the start date
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
                // Show dotted pink circle for predicted cycles
                else if (_isWithinPredictedPeriod(date)) {
                  return Center(
                    child: DottedBorder(
                      color: Colors.pinkAccent.shade100,
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
                helpText: 'Pilih Tanggal Mulai Haid',
              );
              if (start != null) {
                _addHaidPeriod(start); // Only pass the start date
              }
            },
            child: const Text("Tambah Haid"),
          ),
        ],
      ),
    );
  }
}
