import 'package:get/get.dart';
import 'package:nu_bank_clone/api/base_api.dart';
import 'package:nu_bank_clone/app/login/domain/use_cases/login_use_case.dart';
import 'package:nu_bank_clone/app/login/infra/services/login_services.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginUseCase>(
      LoginUseCase(
        LoginServices(
          Get.find<BaseApi>(),
        ),
      ),
    );
  }
}
