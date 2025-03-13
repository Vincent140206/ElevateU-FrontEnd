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
  Future<void> saveStudentData(String university, String jurusan) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('university', university.isNotEmpty ? university : ' ');
    await prefs.setString('jurusan', jurusan.isNotEmpty ? jurusan : ' ');
  }

  //simpen data mentor
  Future<void> saveMentorData(String phone, String address, String keahlian, String posisi, String perusahaan, String gender) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('phone', phone.isNotEmpty ? phone : ' ');
    await prefs.setString('address', address.isNotEmpty ? address : ' ');
    await prefs.setString('keahlian', keahlian.isNotEmpty ? keahlian : ' ');
    await prefs.setString('posisi', posisi.isNotEmpty ? posisi : ' ');
    await prefs.setString('perusahaan', perusahaan.isNotEmpty ? perusahaan : ' ');
    await prefs.setString('gender', gender.isNotEmpty ? gender : 'male');
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

  Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    String? role = prefs.getString('role');
    String? avatar = prefs.getString('avatar_url');
    String? instance = prefs.getString('student_instance');
    String? major = prefs.getString('student_major');
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'avatar_url': avatar,
      'student_instance': instance,
      'student_major': major,
    };
  }

  // simpen email (reset password)
  Future<void> saveEmail (String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  //simpen otp (reset password)
  Future<void> saveOtp(String otp) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('otp', otp);
  }

  Future<String?> getOtp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('otp');
  }

  Future<String> getBearerToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('bearerToken') ?? '';
  }

  Future<void> saveBearerToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bearerToken', token);
  }

  Future<void> saveUserProfileImageUrl(String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userProfileImageUrl', imageUrl);
  }

  Future<String?> getUserProfileImageUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userProfileImageUrl');
  }
}