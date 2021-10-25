import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/controllers/EventoController.dart';
import 'package:standbyme_tcc/controllers/UsuarioController.dart';
import 'package:standbyme_tcc/models/Evento.dart';
import 'package:table_calendar/table_calendar.dart';

class Body extends StatefulWidget {
  int userId;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime _selectedDay = DateTime.now();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events = {};
  TimeOfDay horarioController = TimeOfDay(hour: 00, minute: 00);
  List<dynamic> _selectedEvents = [];

  void initState() {
    super.initState();
    getId();
    _calendarController = CalendarController();
  }

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: horarioController,
    );
    if (newTime != null) {
      setState(() {
        horarioController = newTime;
      });
    }
  }

  void getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      widget.userId = preferences.getInt("id");
    });
  }

  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Widget events() {
    return Container(
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 100),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: _selectedEvents.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  padding: EdgeInsets.fromLTRB(15, 7, 10, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryLightColor.withOpacity(0.5)),
                  child: ListTile(
                    title: Text(
                      _selectedEvents[index].descricaoEvento +
                          ' - ' +
                          _selectedEvents[index].horarioEvento,
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black.withOpacity(0.6),
                          size: 23,
                        ),
                        onPressed: () {
                          EventoController().deleteEvent(
                              widget.userId, _selectedEvents[index].id);

                          setState(() {
                            _selectedEvents.removeAt(index);
                          });
                        }),
                  )),
              SizedBox(height: 10),
            ]);
          }),
    );
  }

  void salvarEsair() async {
    createEvent();
    Navigator.of(context).pop(false);
  }

  void _create(BuildContext context) {
    String _name = "";

    var content = Container(
        child: Column(children: [
      TextField(
        controller: descricaoController,
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
      Text("Horário de início: ", style: TextStyle(color: kPrimaryColor)),
      IconButton(
        icon: Icon(Icons.watch_later_outlined),
        onPressed: _selectTime,
      ),
    ]));

    var btn = FlatButton(
      child: Text('Salvar',
          style: TextStyle(
              color: kTextColor, fontSize: 15, fontWeight: FontWeight.bold)),
      onPressed: () {
        salvarEsair();
      },
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

  Future<Evento> createEvent() async {
    log(widget.userId.toString());
    log(_selectedDay.toString());
    log(horarioController.format(context));
    Evento novoEvento = new Evento(
        descricaoEvento: descricaoController.text,
        dataEvento: _selectedDay,
        horarioEvento: horarioController.format(context),
        userId: widget.userId);
    setState(() {
      _selectedEvents.add(novoEvento);
    });
    return new EventoController().createEvent(novoEvento);
  }

  Future<List<Evento>> getEventsByDate(DateTime dataAtual, int userId) async {
    return new UsuarioController().getEventsByDate(dataAtual, userId);
  }

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

          onDaySelected: (date, events, e) async {
            log(date.toString());
            log(widget.userId.toString());
            var response = await getEventsByDate(date, widget.userId);
            setState(() {
              _selectedDay = date;
              _selectedEvents = response;
            });
          },
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

  Widget eventTitle() {
    log(_selectedEvents.length.toString());
    if (_selectedEvents.length == 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(30, 7, 15, 15),
        child: Text("Não há eventos",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(30, 7, 15, 15),
      child: Text("Eventos",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
    );
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
          eventTitle(),
          events(),
          SizedBox(height: 20)
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
