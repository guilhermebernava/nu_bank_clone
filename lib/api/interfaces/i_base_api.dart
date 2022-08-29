import 'package:dartz/dartz.dart';
import 'package:nu_bank_clone/api/errors/api_exception.dart';

abstract class IBaseApi {
  Future<Either<ApiException, String>> apiPost(String endpoint, String body);
  Future<Either<ApiException, String>> apiGet(String endpoint);
  Future<Either<ApiException, String>> apiPut(String endpoint, String body);
  Future<Either<ApiException, String>> apiDelete(String endpoint, String body);
}
