import 'package:CDNI/Notificacao.dart';
//import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
	static const String TABLE_NAME = "notificacao";
	static const String COLUMN_ID = "id";
	static const String COLUMN_FOLHA = "folha";
	static const String COLUMN_DATA = "data";
	static const String COLUMN_HORARIO = "horario";
	static const String COLUMN_ENDERECO = "endereco";
	static const String COLUMN_NUMERO = "numero";
	static const String COLUMN_COMPLEMENTO = "complemento";
	static const String COLUMN_BAIRRO = "bairro";
	static const String COLUMN_MUNICIPIO = "municipio";
	static const String COLUMN_PROBLEMA = "problema";
	static const String COLUMN_FISCAL = "fiscal";
	static const String COLUMN_CLIENTE = "cliente";
	static const String COLUMN_MATRICULA = "matricula";
	static const String COLUMN_RG = "rg";


	DatabaseProvider._();
	static final DatabaseProvider db = DatabaseProvider._();

	Database _database;

	Future<Database> get database async {
		print("database getter called");

		if (_database != null){
			return _database;
		}
		_database = await createDatabase();

		return _database;
	}
	Future<Database> createDatabase() async {
		String dbPath = await getDatabasesPath();
    String path = join(dbPath, "notificacao.db");

		return await openDatabase(
				path,
				version: 1,
				onCreate: (Database database, int version) async {
				print ("Creating database");

				await database.execute(
						"CREATE TABLE $TABLE_NAME ("
						"$COLUMN_ID INTEGER PRIMARY KEY,"
						"$COLUMN_FOLHA INTEGER,"
						"$COLUMN_DATA INTEGER,"
						"$COLUMN_HORARIO INTEGER,"
						"$COLUMN_ENDERECO TEXT,"
						"$COLUMN_NUMERO INTEGER,"
						"$COLUMN_COMPLEMENTO TEXT,"
						"$COLUMN_BAIRRO TEXT,"
						"$COLUMN_MUNICIPIO TEXT,"
						"$COLUMN_PROBLEMA TEXT,"
						"$COLUMN_FISCAL TEXT,"
						"$COLUMN_CLIENTE TEXT,"
						"$COLUMN_MATRICULA TEXT,"
						"$COLUMN_RG TEXT"
						")",

						);
				},
				);
	}
  Future<List<Notificacao>> getData() async{
    
    final db = await database;

    var notificacoes = await db.query(
      TABLE_NAME,
      columns: [
      COLUMN_ID, 
      COLUMN_FOLHA, 
      COLUMN_DATA, 
      COLUMN_HORARIO, 
      COLUMN_ENDERECO, 
      COLUMN_NUMERO,
      COLUMN_COMPLEMENTO,
      COLUMN_BAIRRO,
      COLUMN_MUNICIPIO,
      COLUMN_PROBLEMA,
      COLUMN_FISCAL,
      COLUMN_CLIENTE,
      COLUMN_MATRICULA,
      COLUMN_RG],
    );
    List<Notificacao> notificacaoList = List<Notificacao>();

    notificacoes.forEach((currentNotificacao) {
      print(currentNotificacao);
      Notificacao notificacao = Notificacao.fromMap(currentNotificacao);
      
      notificacaoList.add(notificacao);
    });

    return notificacaoList;
  }

  Future<Notificacao> insert(Notificacao notificacao) async{
    final db = await database;
    notificacao.id = await db.insert(TABLE_NAME, notificacao.toMap());
    return notificacao;
  }


}
