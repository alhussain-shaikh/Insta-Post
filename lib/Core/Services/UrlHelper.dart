import 'package:shared_preferences/shared_preferences.dart';

class UrlHelper {
  String _serverUrl = 'https://www.instagram.com/';

  UrlHelper() {}

  setNewUrl(String url) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    await _sharedPreferences.setString(_serverUrl, url);
  }

  Future<String> getNewUrl() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    return _sharedPreferences.getString(_serverUrl) ??
        'http://99ff9d16.ngrok.io/requestjson';
  }
}
