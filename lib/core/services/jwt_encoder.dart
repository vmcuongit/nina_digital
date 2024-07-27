import 'dart:convert';
import 'package:crypto/crypto.dart';

class JwtEncoder {
  final String secretKey;

  JwtEncoder({required this.secretKey});

  String encode(Map<String, dynamic> payload) {
    Map<String, String> headers = {'alg': 'HS256', 'typ': 'JWT'};
    String headersEncoded = _base64UrlEncode(jsonEncode(headers));
    String payloadEncoded =
        _base64UrlEncode(jsonEncode(payload, toEncodable: (value) => value));

    String signatureEncoded =
        _generateSignature(headersEncoded, payloadEncoded, secretKey);
    String token = '$headersEncoded.$payloadEncoded.$signatureEncoded';
    return token;
  }

  String _base64UrlEncode(String input) {
    String encoded = base64.encode(utf8.encode(input));
    return encoded
        .replaceAll('+', '-')
        .replaceAll('/', '_')
        .replaceAll('=', '');
  }

  String _base64UrlEncodeBytes(List<int> bytes) {
    return base64
        .encode(bytes)
        .replaceAll('+', '-')
        .replaceAll('/', '_')
        .replaceAll('=', '');
  }

  String _generateSignature(
      String headersEncoded, String payloadEncoded, String secretKey) {
    var key = utf8.encode(secretKey);
    var message = utf8.encode('$headersEncoded.$payloadEncoded');

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(message);

    return _base64UrlEncodeBytes(digest.bytes);
  }
}
