import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dotted_border/dotted_border.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<String>> _events;
  DateTime _selectedDay = DateTime.now();
  DateTime? _startHaid;
  DateTime? _endHaid;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  final int cycleFirstDays = 21; // Siklus prediksi pertama (21 hari)
  final int subsequentCycleDays = 20; // Siklus prediksi selanjutnya (28 hari)

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
      _endHaid = _startHaid!
          .add(const Duration(days: 6)); // 6 hari setelah tanggal mulai

      // Menambahkan event untuk tanggal mulai dan 6 hari berikutnya
      for (DateTime date = _startHaid!;
          date.isBefore(_endHaid!.add(const Duration(days: 1)));
          date = date.add(const Duration(days: 1))) {
        _events.update(date, (existing) => ["Haid"], ifAbsent: () => ["Haid"]);
      }

      // Menambahkan prediksi pertama
      _addFirstPrediction();
    });
  }

  void _addFirstPrediction() {
    DateTime predictionStart = _endHaid!.add(Duration(days: cycleFirstDays));
    DateTime predictionEnd = predictionStart.add(const Duration(days: 7));

    // Menambahkan prediksi pertama
    _addPrediction(predictionStart, predictionEnd);

    // Menambahkan prediksi berkelanjutan (28 hari setelah prediksi pertama)
    _addSubsequentPredictions(predictionEnd);
  }

  void _addSubsequentPredictions(DateTime lastPredictionEnd) {
    DateTime nextPredictionStart =
        lastPredictionEnd.add(Duration(days: subsequentCycleDays));
    DateTime nextPredictionEnd =
        nextPredictionStart.add(const Duration(days: 7));

    while (nextPredictionStart.isBefore(DateTime(2100))) {
      _addPrediction(nextPredictionStart, nextPredictionEnd);

      // Update tanggal prediksi untuk siklus berikutnya
      nextPredictionStart =
          nextPredictionEnd.add(Duration(days: subsequentCycleDays));
      nextPredictionEnd = nextPredictionStart.add(const Duration(days: 7));
    }
  }

  void _addPrediction(DateTime start, DateTime end) {
    for (DateTime date = start;
        date.isBefore(end);
        date = date.add(const Duration(days: 1))) {
      _events.update(date, (existing) => ["Prediksi Haid"],
          ifAbsent: () => ["Prediksi Haid"]);
    }
  }

  bool _isWithinPredictedPeriod(DateTime date) {
    if (_endHaid == null) return false;

    DateTime predictionStart = _endHaid!.add(Duration(days: cycleFirstDays));
    DateTime predictionEnd = predictionStart.add(const Duration(days: 7));

    if (date.isAfter(predictionStart) && date.isBefore(predictionEnd)) {
      return true;
    }

    DateTime nextPredictionStart =
        predictionEnd.add(Duration(days: subsequentCycleDays));
    DateTime nextPredictionEnd =
        nextPredictionStart.add(const Duration(days: 7));

    while (nextPredictionStart.isBefore(DateTime(2100))) {
      if (date.isAfter(nextPredictionStart) &&
          date.isBefore(nextPredictionEnd)) {
        return true;
      }
      nextPredictionStart =
          nextPredictionEnd.add(Duration(days: subsequentCycleDays));
      nextPredictionEnd = nextPredictionStart.add(const Duration(days: 7));
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
                const Color haidColor = Colors.pink;

                if (_startHaid != null && isSameDay(date, _startHaid!)) {
                  return Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: haidColor.withOpacity(0.6),
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
                } else if (_startHaid != null &&
                    date.isAfter(_startHaid!) &&
                    date.isBefore(_endHaid!.add(const Duration(days: 1)))) {
                  return Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: haidColor.withOpacity(0.6),
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
                      color: haidColor.withOpacity(0.6),
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
                _addHaidPeriod(start);
              }
            },
            child: const Text("Tambah Haid"),
          ),
        ],
      ),
    );
  }
}
