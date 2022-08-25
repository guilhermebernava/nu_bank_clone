import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nu_bank_clone/app/splash/domain/entities/loading_params.dart';
import 'package:nu_bank_clone/app/splash/domain/use_cases/splash_use_case.dart';
import 'package:nu_bank_clone/app/splash/error/route_exception.dart';
import 'package:nu_bank_clone/app/splash/infra/services/route_services.dart';

void main() {
  testWidgets('splash should go to route', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Container()));
    final ctx = tester.element(find.byType(Container));
    final splashParams = LoadingParams(
      route: '/',
      context: ctx,
      secondsDuration: 1,
    );
    final splashUseCase = SplashUseCase(RouteServices(), splashParams);

    final result = await tester
        .runAsync<Either<RouteException, bool>>(() => splashUseCase.loading());

    expect(result, isNotNull);
    expect(result!.isRight(), true);
  });

  testWidgets('splash should have route exception', (tester) async {
    await tester.pumpWidget(MaterialApp(home: Container()));
    final ctx = tester.element(find.byType(Container));
    final splashParams = LoadingParams(
      route: '/error',
      context: ctx,
      secondsDuration: 1,
    );
    final splashUseCase = SplashUseCase(RouteServices(), splashParams);

    final result = await tester
        .runAsync<Either<RouteException, bool>>(() => splashUseCase.loading());

    expect(result, isNotNull);
    expect(result!.isLeft(), true);
  });
}
