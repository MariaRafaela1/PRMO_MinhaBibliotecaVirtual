class Usuario {
  late final String nome;
  late final String email;
  

  Usuario({
    required this.nome,
    required this.email,
  });

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['nome'] = nome;
    data['email'] = email;

    return data;
  }

  Usuario.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
  }
}