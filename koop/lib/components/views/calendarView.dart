import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  CalendarView();

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView>
    with SingleTickerProviderStateMixin {
  CalendarController _calendarController;
  DateTime _selectedDay;
  AnimationController _animationController;
  List _selectedEvents;
  Map<DateTime, List> _events;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _events = {
      DateTime.parse("2020-01-23"): ['Event A6', 'Event B6'],
      DateTime.parse("2020-01-23"): ['Event A7', 'Event B6'],
      DateTime.parse("2020-01-23"): ['Event A6', 'Event B6'],
      DateTime.parse("2020-01-23"): ['Event A6', 'Event B6'],
    };
    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TableCalendar(
          calendarController: _calendarController,
          events: _events,
          initialSelectedDay: _selectedDay,
          onDaySelected: _onDaySelected,
          calendarStyle: CalendarStyle(
            selectedColor: Color(0xFFD4AF37),
            todayColor: Color(0x60D4AF37),
            markersColor: Colors.red,
            outsideDaysVisible: false,
          ),
        ),
        Expanded(child: _buildEventList()),
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Card(
            elevation: 6,
                      child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    title: Text(event.toString()),
                    onTap: () => print('$event tapped!'),
                  ),
                ),
          ))
          .toList(),
    );
  }
}