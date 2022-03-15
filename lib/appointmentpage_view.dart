// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.grey, Colors.black],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Appointment',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        body: SfCalendar(
          // backgroundColor: Colors.white,
          view: CalendarView.timelineDay,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        )
      ),
    );
  }
}


List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
}


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

// class Meeting {
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }