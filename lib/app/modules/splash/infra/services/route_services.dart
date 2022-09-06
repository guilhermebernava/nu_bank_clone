import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nu_bank_clone/app/modules/splash/domain/entities/loading_params.dart';
import 'package:nu_bank_clone/app/modules/splash/domain/interfaces/i_route_services.dart';
import 'package:nu_bank_clone/app/modules/splash/error/route_exception.dart';

class RouteServices implements IRouteServices {
  @override
  Future<Either<RouteException, bool>> redirectTo(LoadingParams params) async {
    return await Future.delayed(Duration(seconds: params.secondsDuration))
        .then((value) {
      try {
        Navigator.of(params.context).pushReplacementNamed(params.route);
        return const Right(true);
      } catch (e) {
        return Left(RouteException('Invalid Route'));
      }
    });
  }
}
