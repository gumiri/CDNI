import 'DatabaseProvider.dart';

class Usuario {
  int id;
  String matricula;
  String nome;
  String rg;
  String endereco;

  Usuario() {}

  Usuario.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    matricula = map[DatabaseProvider.COLUMN_MATRICULA_USUARIO];
    nome = map[DatabaseProvider.COLUMN_NOME_USUARIO];
    rg = map[DatabaseProvider.COLUMN_RG_USUARIO];
    endereco = map[DatabaseProvider.COLUMN_ENDERECO_USUARIO];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      DatabaseProvider.COLUMN_ID: id,
      DatabaseProvider.COLUMN_MATRICULA_USUARIO: matricula,
      DatabaseProvider.COLUMN_NOME_USUARIO: nome,
      DatabaseProvider.COLUMN_RG_USUARIO: rg,
      DatabaseProvider.COLUMN_ENDERECO_USUARIO: endereco
    };
    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }
    return map;
  }
}
