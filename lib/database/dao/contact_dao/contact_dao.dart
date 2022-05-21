import 'package:sqflite/sqflite.dart';
import '../../../models/contact.dart';
import '../../app_database.dart';

class ContactDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contacMap = _toMap(contact);
    return db.insert(_tableName, contacMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contacMap = Map();
    contacMap[_name] = contact.name;
    contacMap[_accountNumber] = contact.accountNumber;
    return contacMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =  await db.query(_tableName);
    final List<Contact> contacts = List<Contact>.empty( growable: true);
    _toList(result, contacts);
    return contacts;
  }

  void _toList(List<Map<String, dynamic>> result, List<Contact> contacts) {
    for (Map<String, dynamic> row in result) {
      final Contact contact =
      Contact(row[_id], row[_name], row[_accountNumber]);
      contacts.add(contact);
    }
  }
}