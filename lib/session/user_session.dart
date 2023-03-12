import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class UserSession {
  //  User Session class for managing dummy user session...

  static final UserSession _singleton = UserSession._internal();
  static Database? _database;
  static const String storeName = 'user_sessions';
  static const String keyName = 'session';

  factory UserSession() {
    return _singleton;
  }

  UserSession._internal();

  Future<void> initialize(String path) async {
    _database ??=
        await databaseFactoryIo.openDatabase('${path}user_sessions.db');
  }

  Future<void> saveSession(Map<String, dynamic> session) async {
    if (_database == null) {
      throw Exception('Database not initialized');
    }
    var store = intMapStoreFactory.store(storeName);
    await store.record(1).put(_database!, session);
  }

  Future<Map<String, dynamic>?> getSession() async {
    if (_database == null) {
      throw Exception('Database not initialized');
    }
    var store = intMapStoreFactory.store(storeName);
    return await store.record(1).get(_database!);
  }

  Future<void> deleteSession() async {
    if (_database == null) {
      throw Exception('Database not initialized');
    }
    var store = intMapStoreFactory.store(storeName);
    await store.record(1).delete(_database!);
  }
}
