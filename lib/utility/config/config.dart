import 'package:flutter_riverpod/flutter_riverpod.dart';

class Config {
  final String baseURL;

  final String appId;

  final String token;

  final bool isAliceEnabled;

  final timeOutInMilliSecond = 30000;

  Config({
    required this.baseURL,
    required this.appId,
    required this.token,
    this.isAliceEnabled = false,
  });
}

final configProvider = Provider<Config>((ref) {
  const isAliceEnabled = false;

  // Dev

  const appId = '6294bad4cf723b57bbbc9eb2';

  const token =
          '4upLMFtrq3UaZv6SKjt6yaYavMSDxwuaZf88EsqOt3BeOTgwzcH27hV029jMynsXWYC9rOaNhK9pvHX1A40waQ==',
      url = 'https://navisafeapidev.azurewebsites.net';

  return Config(
    baseURL: url,
    appId: appId,
    token: token,
    isAliceEnabled: isAliceEnabled,
  );
});
