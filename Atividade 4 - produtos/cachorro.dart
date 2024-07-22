class Cachorro {
  final int id;
  final String nome;
  final int idade;

  const Cachorro({
    required this.id,
    required this.nome,
    required this.idade,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
    };
  }

  @override
  String toString() {
    return 'Cachorro{id: $id, nome: $nome, idade: $idade}';
  }
}
