import 'package:flutter/rendering.dart';
import 'DatabaseProvider.dart';

class Notificacao {
  int id;
  int folha;
  int data;
  int horario;
  String endereco;
  int numero;
  String complemento;
  String bairro;
  String municipio;
  String problema;
  String fiscal;
  String cliente;
  String matricula;
  String rg;

  Notificacao() {}

  Notificacao.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    folha = map[DatabaseProvider.COLUMN_FOLHA];
    data = map[DatabaseProvider.COLUMN_DATA];
    horario = map[DatabaseProvider.COLUMN_HORARIO];
    endereco = map[DatabaseProvider.COLUMN_ENDERECO];
    numero = map[DatabaseProvider.COLUMN_NUMERO];
    complemento = map[DatabaseProvider.COLUMN_COMPLEMENTO];
    bairro = map[DatabaseProvider.COLUMN_BAIRRO];
    municipio = map[DatabaseProvider.COLUMN_MUNICIPIO];
    problema = map[DatabaseProvider.COLUMN_PROBLEMA];
    fiscal = map[DatabaseProvider.COLUMN_FISCAL];
    cliente = map[DatabaseProvider.COLUMN_CLIENTE];
    matricula = map[DatabaseProvider.COLUMN_MATRICULA];
    rg = map[DatabaseProvider.COLUMN_RG];
  }

  //contato para Mapa
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      DatabaseProvider.COLUMN_ID: id,
      DatabaseProvider.COLUMN_FOLHA: folha,
      DatabaseProvider.COLUMN_DATA: data,
      DatabaseProvider.COLUMN_HORARIO: horario,
      DatabaseProvider.COLUMN_ENDERECO: endereco,
      DatabaseProvider.COLUMN_NUMERO: numero,
      DatabaseProvider.COLUMN_COMPLEMENTO: complemento,
      DatabaseProvider.COLUMN_BAIRRO: bairro,
      DatabaseProvider.COLUMN_MUNICIPIO: municipio,
      DatabaseProvider.COLUMN_PROBLEMA: problema,
      DatabaseProvider.COLUMN_FISCAL: fiscal,
      DatabaseProvider.COLUMN_CLIENTE: cliente,
      DatabaseProvider.COLUMN_MATRICULA: matricula,
      DatabaseProvider.COLUMN_RG: rg
    };
    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }
    return map;
  }
}
