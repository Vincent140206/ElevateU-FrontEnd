class ApiConstant {
  static const String baseUrl = "https://elevateu.nathakusuma.com/api/v1";

  // AUTH
  static const String otp = "$baseUrl/auth/register/otp";
  static const String register = "$baseUrl/auth/register";
  static const String login = "$baseUrl/auth/login";
  static const String refresh = "$baseUrl/auth/refresh";
  static const String logout = "$baseUrl/auth/logout";
  static const String resetPasswordOtp = "$baseUrl/auth/reset-password/otp";
  static const String resetPassword = "$baseUrl/auth/reset-password";

  // USER
  static const String getUser = "$baseUrl/users/me";
  static const String deleteUser = "$baseUrl/users/me";
  static const String patchUser = "$baseUrl/users/me";
  static const String updateAvatar = "$baseUrl/users/me/avatar";
  static const String deleteAvatar = "$baseUrl/users/me/avatar";

  // CATEGORY
  static const String newCategory = "$baseUrl/categories";
}