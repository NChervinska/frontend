import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@injectable
@preResolve
class PreferencesService {
  static const _accessTokenKey = '_accessTokenKey';

  final SharedPreferences _prefs;

  PreferencesService._(this._prefs);

  @factoryMethod
  static Future<PreferencesService> getInstance() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesService._(prefs);
  }

  String? getAccessToken() => _prefs.getString(_accessTokenKey);

  Future<void> setAccessToken(String accessToken) async {
    await _prefs.setString(_accessTokenKey, accessToken);
  }

  Future<void> logout() async {
    await _prefs.remove(_accessTokenKey);
  }
}
