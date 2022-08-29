class ApiException implements Exception {
  final String errorCode;
  final String endpoint;

  ApiException({
    required this.errorCode,
    required this.endpoint,
  });

  @override
  String toString() {
    return 'Message: oops, something went wrong, \nHttp Status Code: $errorCode, \n Endpoint: $endpoint.';
  }
}
