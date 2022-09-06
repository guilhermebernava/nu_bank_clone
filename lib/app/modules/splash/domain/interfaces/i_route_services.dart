import 'package:dartz/dartz.dart';
import 'package:nu_bank_clone/app/modules/splash/domain/entities/loading_params.dart';
import 'package:nu_bank_clone/app/modules/splash/error/route_exception.dart';

abstract class IRouteServices {
  Future<Either<RouteException, bool>> redirectTo(LoadingParams params);
}
