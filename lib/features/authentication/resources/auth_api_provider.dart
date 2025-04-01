import 'package:testapp/common/http/api_provider.dart';

class AuthApiProvider {
  final ApiProvider apiProvider;
  final String baseUrl;

  AuthApiProvider({required this.apiProvider, required this.baseUrl});

  Future<dynamic> requestOtp({
    required String phoneNumber,
    required String userType,
  }) async {
    final body = {"phone": phoneNumber};

    final url = '$baseUrl/auth/generate-otp/$userType';
    return await apiProvider.post(url, body);
  }

  Future<dynamic> validateOtp({
    required String phoneNumber,
    required String otpCode,
  }) async {
    final body = {"phone": phoneNumber, "otp": otpCode};

    final url = '$baseUrl/auth/login';
    return await apiProvider.post(url, body);
  }

  Future<dynamic> resendOtp({
    required String phoneNumber,
    required String userType,
  }) async {
    final body = {"carrierPhone": phoneNumber};

    final url = '$baseUrl/auth/resend-otp/$userType';
    return await apiProvider.patch(url, body);
  }
}
