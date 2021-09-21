class Usuario {
  int id;
  String primeiroNome, sobrenome, email, senha, telefone;

  Usuario.empty();

  Usuario(this.id, this.primeiroNome, this.sobrenome, this.telefone, this.email,
      this.senha);

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
        parsedJson['id'],
        parsedJson['nomeUsuario'],
        parsedJson['sobrenomeUsuario'],
        parsedJson['telefone'],
        parsedJson['email'],
        parsedJson['senha']);
  }
}
