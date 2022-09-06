class ApiException implements Exception {
  final String errorCode;
  final String endpoint;

  ApiException({
    required this.errorCode,
    required this.endpoint,
  });

  @override
  String toString() {
    return 'Http Status Code: $errorCode, \n Endpoint: $endpoint.';
  }
}
