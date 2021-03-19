class AuthorizationArguments {
  final String appName;
  final String iconUrl;
  final String clientId;
  final String clientSecret;
  final String dialCode;
  final String phoneNumber;

  AuthorizationArguments(
      {this.appName,
      this.iconUrl,
      this.clientId,
      this.clientSecret,
      this.dialCode,
      this.phoneNumber});
}
