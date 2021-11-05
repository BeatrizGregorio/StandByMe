class Evento {
  int id;
  String descricaoEvento, horarioEvento;
  DateTime dataEvento;
  int userId;

  Evento.empty();

  Evento(
      {this.id,
      this.descricaoEvento,
      this.dataEvento,
      this.horarioEvento,
      this.userId});

  String toString() {
    return "";
  }

  factory Evento.fromJson(Map<String, dynamic> parsedJson) {
    return Evento(
      id: parsedJson['id'],
      descricaoEvento: parsedJson['descricaoEvento'],
      dataEvento: DateTime.parse(parsedJson['dataEvento']),
      horarioEvento: parsedJson['horarioEvento'],
      userId: parsedJson['userId'],
    );
  }
}
