class Evento {
  String descricaoEvento, horarioEvento;
  DateTime dataEvento;
  int userId;

  Evento.empty();

  Evento(
      {this.descricaoEvento, this.dataEvento, this.horarioEvento, this.userId});

  factory Evento.fromJson(Map<String, dynamic> parsedJson) {
    return Evento(
      descricaoEvento: parsedJson['descricaoEvento'],
      dataEvento: parsedJson['dataEvento'],
      horarioEvento: parsedJson['horarioEvento'],
      userId: parsedJson['userId'],
    );
  }
}
