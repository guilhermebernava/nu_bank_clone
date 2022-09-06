import 'package:get/get.dart';
import 'package:nu_bank_clone/api/base_api.dart';
import 'package:nu_bank_clone/app/modules/login/domain/use_cases/login_use_case.dart';
import 'package:nu_bank_clone/app/modules/login/infra/services/user_services.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginUseCase>(
      LoginUseCase(
        UserServices(
          Get.find<BaseApi>(),
        ),
      ),
    );
  }
}
