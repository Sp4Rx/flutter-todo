import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/repository/repoImp.dart';

class Repo implements RepoImp {
  SharedPreferences? prefs;

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  String? getData(String key) {
    return prefs?.getString(key);
  }

  @override
  void setData(String key, String data) {
    prefs?.setString(key, data);
  }
}
