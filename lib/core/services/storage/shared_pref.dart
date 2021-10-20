import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil? _storageUtil;
  static SharedPreferences? _preferences;

  StorageUtil._();
  static Future<StorageUtil?> getInstance() async {
    if (_storageUtil == null) {
      _storageUtil ?? StorageUtil._();
    }

    if (_preferences == null) {
      _preferences ?? await SharedPreferences.getInstance();
    }
    // if (_storageUtil == null) {
    //   // keep local instance till it is fully initialized.
    //   var secureStorage = StorageUtil._();
    //   ;
    //   _storageUtil = secureStorage;
    // }
    return _storageUtil;
  }

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // get string
  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;
    return _preferences?.getString(key) ?? defValue;
  }

  // put string
  static Future<bool?> putString(String key, String value) async {
    return await _preferences?.setString(key, value);
  }

  static Future<bool>? removeString(String key) {
    if (_preferences == null) return null;
    return _preferences?.remove(key);
  }
}
