class EventoBase {
  String descricaoEvento, horarioEvento;
  DateTime dataEvento;
  int userId;

  EventoBase.empty();

  EventoBase(
      {this.descricaoEvento, this.dataEvento, this.horarioEvento, this.userId});

  factory EventoBase.fromJson(Map<String, dynamic> parsedJson) {
    return EventoBase(
      descricaoEvento: parsedJson['descricaoEvento'],
      dataEvento: DateTime.parse(parsedJson['dataEvento']),
      horarioEvento: parsedJson['horarioEvento'],
      userId: parsedJson['userId'],
    );
  }
}
