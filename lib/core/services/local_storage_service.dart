import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String accessTokenKey = "access_token";
  static const String refreshTokenKey = "refresh_token";

  //save token
  Future<void> saveToken (String accessToken, String refreshToken) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessTokenKey, accessToken);
    await prefs.setString(refreshTokenKey, refreshToken);
  }

  //ambil access token
  Future<String?> getAccessToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessTokenKey);
  }

  //ambil refresh token
  Future<String?> getRefreshToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(refreshTokenKey);
  }

  //clear token
  Future<void> clearToken() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(accessTokenKey);
    await prefs.remove(refreshTokenKey);
  }

  //simpen data user
  Future<void> saveUserData(String name, String email, String password, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('role', role);
  }

  //simpen data student
  Future<void> saveStudentData(String address, String university, String jurusan) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', address);
    await prefs.setString('university', university);
    await prefs.setString('jurusan', jurusan);
  }

  //simpen data mentor
  Future<void> saveMentorData(String phone, String address, String keahlian, String posisi, String perusahaan) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', phone);
    await prefs.setString('address', address);
    await prefs.setString('keahlian', keahlian);
    await prefs.setString('posisi', posisi);
    await prefs.setString('perusahaan', perusahaan);
  }

  //simpen data user (setelah login)
  Future<void> saveUserDataLoggedIn(
      String id,
      String name,
      String email,
      String role,
      String avatarUrl,
      String instance,
      String major,
      )
  async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', id);
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('role', role);
    await prefs.setString('avatar_url', avatarUrl);
    await prefs.setString('student_instance', instance);
    await prefs.setString('student_major', major);
  }
}