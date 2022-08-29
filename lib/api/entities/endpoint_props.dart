import 'dart:isolate';

class EndpointProps {
  final String endpoint;
  final Map<String, String> headers;
  final String? body;
  final SendPort sendPort;

  EndpointProps({
    required this.endpoint,
    required this.sendPort,
    required this.headers,
    this.body,
  });
}
