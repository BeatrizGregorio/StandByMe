class UsuarioBase {
  String primeiroNome, sobrenome, email, senha, telefone;

  UsuarioBase.empty();

  UsuarioBase(
      {this.primeiroNome,
      this.sobrenome,
      this.telefone,
      this.email,
      this.senha});

  factory UsuarioBase.fromJson(Map<String, dynamic> parsedJson) {
    return UsuarioBase(
        primeiroNome: parsedJson['nomeUsuario'],
        sobrenome: parsedJson['sobrenomeUsuario'],
        telefone: parsedJson['telefone'],
        email: parsedJson['email'],
        senha: parsedJson['senha']);
  }
}
