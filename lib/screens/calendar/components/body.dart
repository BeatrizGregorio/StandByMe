import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/calendar/calendar_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      view: CalendarView.month,
    );
  }
}
