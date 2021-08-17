import 'package:flutter/foundation.dart';
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
            selectionDecoration: BoxDecoration(
              color: Color.fromARGB(100, 153, 51, 153),
              border: Border.all(
                  color: Color.fromARGB(200, 153, 51, 153), width: 2),
              shape: BoxShape.circle,
            ),
            allowedViews: [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
            ],
            todayHighlightColor: Colors.white,
            cellBorderColor: Colors.transparent,
            monthViewSettings: MonthViewSettings(
                agendaStyle: AgendaStyle(
                  dateTextStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  dayTextStyle: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(200, 153, 51, 153),
                      fontWeight: FontWeight.w400),
                ),
                showAgenda: true,
                agendaViewHeight: 225,
                agendaItemHeight: 70,
                appointmentDisplayCount: 3,
                dayFormat: 'EEE',
                monthCellStyle: MonthCellStyle(
                    trailingDatesBackgroundColor:
                        Color.fromARGB(20, 153, 51, 153),
                    leadingDatesBackgroundColor:
                        Color.fromARGB(20, 153, 51, 153),
                    textStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(200, 153, 51, 153),
                        fontFamily: 'Times New Roman'))),
            headerStyle: CalendarHeaderStyle(
                textAlign: TextAlign.left,
                textStyle: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Times New Roman',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                )),
            todayTextStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'Times New Roman',
                color: Color.fromARGB(200, 153, 51, 153),
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
