import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/calendar/calendar_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:standbyme_tcc/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SfCalendar(
            view: CalendarView.month,
            showDatePickerButton: true,
            initialSelectedDate: DateTime.now(),
            allowedViews: [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
            ],
            todayHighlightColor: Color.fromARGB(200, 153, 51, 153),
            cellBorderColor: Colors.transparent,
            monthViewSettings: MonthViewSettings(
                showAgenda: true,
                agendaViewHeight: 250,
                agendaItemHeight: 70,
                appointmentDisplayCount: 3,
                dayFormat: 'EEE',
                monthCellStyle: MonthCellStyle(
                  trailingDatesBackgroundColor: Colors.teal[50],
                  leadingDatesBackgroundColor: Colors.teal[50],
                )),
            headerStyle: CalendarHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ),
    );
  }
}
