import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class AppleAuthentication {
  static String secretKey = """
-----BEGIN PRIVATE KEY-----
MIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQg7mukbRLTT6aXC3PL
myx+ZpxkJS9xHU6QK4yYGfgGDc2gCgYIKoZIzj0DAQehRANCAASPYz9qPSwGtgwl
dWvSyRcmHoFq3sQQGUOGwr6wpqRxM2UerVzE2ekI4KEWZLhciksg85yzN75fmlun
CvvmLKnL
-----END PRIVATE KEY-----""";

  static String algorithm = "ES256";
  static String keyId = "724Z7DL97T"; // Key ID from apple developer
  static String issuer =
      "AM2NVA9V8P"; // 10 character team ID from apple developer
  static String token = "";

  static void generateJwt() {
    final jwt = JWT(header: {
      'alg': algorithm,
      'kid': keyId
    }, {
      'iss': issuer,
      'iat': (DateTime.now().millisecondsSinceEpoch ~/ 1000),
      'exp': (DateTime.now().millisecondsSinceEpoch ~/ 1000) + 3600
    });
    token = jwt.sign(ECPrivateKey(secretKey), algorithm: JWTAlgorithm.ES256);
  }
}
