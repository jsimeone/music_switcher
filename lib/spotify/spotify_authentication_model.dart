class SpotifyAuthentication {
  final String accessToken;
  final String tokenType;
  final int expiresIn;

  // Constructor for this class with required arguments
  const SpotifyAuthentication(
      {required this.accessToken,
      required this.tokenType,
      required this.expiresIn});

  /// Manually generate an instance of SpotifyAuthentication based on JSON.
  factory SpotifyAuthentication.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'access_token': String accessToken,
        'token_type': String tokenType,
        'expires_in': int expiresIn
      } =>
        SpotifyAuthentication(
            accessToken: accessToken,
            tokenType: tokenType,
            expiresIn: expiresIn),
      _ =>
        throw const FormatException('Failed to decode spotify authentication'),
    };
  }
}
