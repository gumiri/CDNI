import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotificacaoHelper {
  static final NotificacaoHelper _instance = NotificacaoHelper.internal();

  factory NotificacaoHelper() => _instance;
  NotificacaoHelper.internal();

  Database _db;

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE NotificacaoTable(idColumn INTEGER PRIMARY KEY, "
          "folhaColumn TEXT, dataColumn TEXT,"
          "horarioColumn TEXT, enderecoColumn TEXT,"
          "numeroColumn TEXT, complementoColumn TEXT,"
          "bairroColumn TEXT, municipioColumn TEXT,"
          "problemaColumn TEXT, fiscalColumn TEXT,"
          "clienteColumn TEXT, matriculaColumn TEXT, rgColumn TEXT)");
    });
  }

  Future<Notificacao> saveNotificacao(Notificacao notificacao) async {
    Database dbNotificacao = await db;
    notificacao.id =
        await dbNotificacao.insert("NotificacaoTable", notificacao.toMap());
    return notificacao;
  }

  Future<Notificacao> getNotificacao(int id) async {
    Database dbNotificacao = await db;
    List<Map> maps = await dbNotificacao.query("NotificacaoTable",
        columns: [
          "idColumn",
          "folhaColumn",
          "dataColumn",
          "horarioColumn",
          "enderecoColumn",
          "numeroColumn",
          "complementoColumn",
          "bairroColumn",
          "municipioColumn",
          "problemaColumn",
          "fiscalColumn",
          "clienteColumn",
          "matriculaColumn",
          "rgColumn"
        ],
        where: "idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Notificacao.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List> getAllNotificacao() async {
    Database dbNotificacao = await db;
    List listMap =
        await dbNotificacao.rawQuery("SELECT * FROM NotificacaoTable");
    List<Notificacao> listNotificacao = List();
    for (Map m in listMap) {
      listNotificacao.add(Notificacao.fromMap(m));
    }
    return listNotificacao;
  }

  Future close() async {
    Database dbNotificacao = await db;
    dbNotificacao.close();
  }
}

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

  Notificacao.fromMap(Map map) {
    id = map['idColumn'];
    folha = map['folhaColumn'];
    data = map['dataColumn'];
    horario = map['horarioColumn'];
    endereco = map['enderecoColumn'];
    numero = map['numeroColumn'];
    complemento = map['complementoColumn'];
    bairro = map['bairroColumn'];
    municipio = map['municipioColumn'];
    problema = map['problemaColumn'];
    fiscal = map['fiscalColumn'];
    cliente = map['clienteColumn'];
    matricula = map['matriculaColumn'];
    rg = map['rgColumn'];
  }

  //contato para Mapa
  Map toMap() {
    Map<String, dynamic> map = {
      'idColumn': id,
      'folhaColumn': folha,
      'dataColumn': data,
      'horarioColumn': horario,
      'enderecoColumn': endereco,
      'numeroColumn': numero,
      'complementoColumn': complemento,
      'bairroColumn': bairro,
      'municipioColumn': municipio,
      'problemaColumn': problema,
      'fiscalColumn': fiscal,
      'clienteColumn': cliente,
      'matriculaColumn': matricula,
      'rgColumn': rg
    };
    if (id != null) {
      map['idColumn'] = id;
    }
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
