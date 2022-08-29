import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:nu_bank_clone/api/entities/base_api_props.dart';
import 'package:nu_bank_clone/api/entities/endpoint_props.dart';
import 'package:nu_bank_clone/api/errors/api_exception.dart';
import 'package:nu_bank_clone/api/interfaces/i_base_api.dart';

class BaseApi implements IBaseApi {
  final BaseApiProps props;

  BaseApi(this.props);

  @override
  Future<Either<ApiException, String>> apiDelete(
    String endpoint,
    String body,
  ) async {
    final port = ReceivePort();
    await Isolate.spawn<EndpointProps>(
      (value) async {
        final response = await delete(
          Uri.parse(value.endpoint),
          body: value.body,
          headers: value.headers,
        );
        value.sendPort.send(response);
      },
      EndpointProps(
        endpoint: props.apiUrl + endpoint,
        sendPort: port.sendPort,
        headers: props.headers,
      ),
    );

    final response = await port.first;

    if (response.statusCode != 200) {
      return Left(
        ApiException(
          endpoint: props.apiUrl + endpoint,
          errorCode: response.statusCode.toString(),
        ),
      );
    }

    return Right(response.body);
  }

  @override
  Future<Either<ApiException, String>> apiGet(String endpoint) async {
    final port = ReceivePort();
    await Isolate.spawn<EndpointProps>(
      (value) async {
        final response = await get(
          Uri.parse(value.endpoint),
          headers: value.headers,
        );
        value.sendPort.send(response);
      },
      EndpointProps(
        endpoint: props.apiUrl + endpoint,
        sendPort: port.sendPort,
        headers: props.headers,
      ),
    );

    final response = await port.first;

    if (response.statusCode != 200) {
      return Left(
        ApiException(
          endpoint: props.apiUrl + endpoint,
          errorCode: response.statusCode.toString(),
        ),
      );
    }

    return Right(response.body);
  }

  @override
  Future<Either<ApiException, String>> apiPost(
    String endpoint,
    String body,
  ) async {
    final port = ReceivePort();
    await Isolate.spawn<EndpointProps>(
      (value) async {
        final response = await post(
          Uri.parse(value.endpoint),
          body: value.body,
          headers: value.headers,
        );
        value.sendPort.send(response);
      },
      EndpointProps(
        endpoint: props.apiUrl + endpoint,
        sendPort: port.sendPort,
        headers: props.headers,
      ),
    );

    final response = await port.first;

    if (response.statusCode != 200) {
      return Left(
        ApiException(
          endpoint: props.apiUrl + endpoint,
          errorCode: response.statusCode.toString(),
        ),
      );
    }

    return Right(response.body);
  }

  @override
  Future<Either<ApiException, String>> apiPut(
    String endpoint,
    String body,
  ) async {
    final port = ReceivePort();
    await Isolate.spawn<EndpointProps>(
      (value) async {
        final response = await post(
          Uri.parse(value.endpoint),
          body: value.body,
          headers: value.headers,
        );
        value.sendPort.send(response);
      },
      EndpointProps(
        endpoint: props.apiUrl + endpoint,
        sendPort: port.sendPort,
        headers: props.headers,
      ),
    );

    final response = await port.first;

    if (response.statusCode != 200) {
      return Left(
        ApiException(
          endpoint: props.apiUrl + endpoint,
          errorCode: response.statusCode.toString(),
        ),
      );
    }

    return Right(response.body);
  }
}
