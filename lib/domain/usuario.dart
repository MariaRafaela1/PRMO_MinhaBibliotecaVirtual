class Usuario {
  late final String nome;
  late final String email;
  late final String senha;
  

  Usuario({
    required this.nome,
    required this.email,
    required this.senha,
  });

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['nome'] = nome;
    data['email'] = email;
    data['senha'] = senha;

    return data;
  }

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
  }
}