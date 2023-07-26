import 'dart:convert';
import 'dart:io' as io;
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';

class TokenRepository {

  Future<String> getToken(String deviceId) async {
    String url = "http://223.130.139.200/api/user/get_token/";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'user_number': await getDeviceId(),
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        String token = responseJson['token'];

        if (token != null && token is String) {
          return token;
        } else {
          throw Exception('토큰 가져오기 에러: 토큰이 없거나, 올바른 형식이 아닙니다');
        }
      } else {
        throw Exception('토큰 가져오기 에러1: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('토큰 가져오기 에러2: $error');
    }
  }

  Future<String> getDeviceId() async {

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (io.Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id; // Unique ID for Android
    } else if (io.Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor!; // Unique ID for iOS
    } else {
      throw Exception("Unsupported platform");
    }
  }

}
