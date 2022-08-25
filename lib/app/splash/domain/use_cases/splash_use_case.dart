import 'package:dartz/dartz.dart';
import 'package:nu_bank_clone/app/splash/domain/entities/splash_props.dart';
import 'package:nu_bank_clone/app/splash/domain/interfaces/i_route_services.dart';
import 'package:nu_bank_clone/app/splash/domain/interfaces/i_splash_use_case.dart';
import 'package:nu_bank_clone/app/splash/error/route_exception.dart';

class SplashUseCase implements ISplashUseCase {
  final IRouteServices _routeServices;

  SplashUseCase(this._routeServices);

  @override
  Future<Either<RouteException, bool>> loading(SplashParams params) async {
    return await _routeServices.redirectTo(params);
  }
}
