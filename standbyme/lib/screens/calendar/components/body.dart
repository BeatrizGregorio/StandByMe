import 'dart:ui';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/size_config.dart';

//import 'package:provider/provider.dart';
//import 'package:standbyme_tcc/constants.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart' as prefix;
import 'package:table_calendar/table_calendar.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime _selectedDay = DateTime.now();

  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events = {};
  //List<CalendarItem> _data = [];

  List<dynamic> _selectedEvents = [];
  List<Widget> get _eventWidgets =>
      _selectedEvents.map((e) => events(e)).toList();

  void initState() {
    super.initState();
    //DB.init().then((value) => _fetchEvents());
    _calendarController = CalendarController();
  }

  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Widget events(var d) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          )),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(d, style: Theme.of(context).primaryTextTheme.bodyText1),
            /*
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.redAccent,
                  size: 15,
                ),
                onPressed: () => {} /*_deleteEvent(d)*/)*/
          ])),
    );
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  void _create(BuildContext context) {
    String _name = "";

    var content = Container(
        child: Column(children: [
      TextField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Descrição do evento ',
          labelStyle: TextStyle(color: kPrimaryColor, fontSize: 18),
        ),
        onChanged: (value) {
          _name = value;
        },
      ),
      SizedBox(height: 20),
      TextField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Horário de início',
          labelStyle: TextStyle(color: kPrimaryColor, fontSize: 18),
        ),
        onChanged: (value) {
          _name = value;
        },
      )
    ]));

    var btn = FlatButton(
      child: Text('Salvar',
          style: TextStyle(
              color: kTextColor, fontSize: 15, fontWeight: FontWeight.bold)),
      onPressed: () => {} /*_addEvent(_name)*/,
    );
    var cancelButton = FlatButton(
        child: Text('Cancelar',
            style: TextStyle(
                color: kTextColor, fontSize: 15, fontWeight: FontWeight.bold)),
        onPressed: () => Navigator.of(context).pop(false));
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text("Adicionar evento",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 17,
                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          child: content,
                        ),
                      )),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[cancelButton, btn]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
  void _fetchEvents() async{
    _events = {};
    List<Map<String, dynamic>> _results = await DB.query(CalendarItem.table);
    _data = _results.map((item) => CalendarItem.fromMap(item)).toList();
      _data.forEach((element) {
        DateTime formattedDate = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.parse(element.date.toString())));
      if(_events.containsKey(formattedDate)){
        _events[formattedDate].add(element.name.toString());
      }
      else{
          _events[formattedDate] = [element.name.toString()];
        }
      }
    );
    setState(() {});
  }

   void _addEvent(String event) async{
    CalendarItem item = CalendarItem(
      date: _selectedDay.toString(),
      name: event
    );
    await DB.insert(CalendarItem.table, item);
    _selectedEvents.add(event);
    _fetchEvents();
    
    Navigator.pop(context);
  }

  // Delete doesnt refresh yet, thats it, then done!
  void _deleteEvent(String s){
    List<CalendarItem> d = _data.where((element) => element.name == s).toList();
    if(d.length == 1){
      DB.delete(CalendarItem.table, d[0]);
      _selectedEvents.removeWhere((e) => e == s);
      _fetchEvents();
    }
  }
*/

  Widget calendar() {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              kPrimaryLightColor.withOpacity(0.6),
              kPrimaryLightColor.withOpacity(0.6)
            ]),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: new Offset(0.0, 5))
            ]),
        child: TableCalendar(
          locale: 'pt_Br',
          calendarStyle: CalendarStyle(
            canEventMarkersOverflow: true,
            markersColor: Colors.white,
            weekdayStyle: TextStyle(color: Colors.white, fontSize: 17),
            todayColor: Colors.white54,
            todayStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
                fontWeight: FontWeight.bold),
            selectedColor: kPrimaryLightColor.withOpacity(0.7),
            outsideWeekendStyle: TextStyle(color: Colors.white60, fontSize: 17),
            outsideStyle: TextStyle(color: Colors.white54, fontSize: 17),
            weekendStyle: TextStyle(color: Colors.white, fontSize: 17),
            renderDaysOfWeek: true,
          ),
          //onDaySelected: _onDaySelected,
          calendarController: _calendarController,
          events: _events,
          headerStyle: HeaderStyle(
            centerHeaderTitle: true,
            formatButtonVisible: false,
            leftChevronIcon:
                Icon(Icons.arrow_back_ios, size: 17, color: Colors.white),
            rightChevronIcon:
                Icon(Icons.arrow_forward_ios, size: 17, color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              "Calendário",
              style: TextStyle(color: kPrimaryColor, fontSize: 24),
            ),
          ),

          calendar(),
          //eventTitle(),
          Column(children: _eventWidgets),
          SizedBox(height: 60)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () => _create(context),
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
