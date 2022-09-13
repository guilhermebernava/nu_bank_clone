import 'package:get/instance_manager.dart';
import 'package:nu_bank_clone/api/base_api.dart';
import 'package:nu_bank_clone/api/entities/base_api_props.dart';
import 'package:nu_bank_clone/stores/user_store.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      BaseApi(
        BaseApiProps(
          apiUrl: 'https://bernava-finance-app.herokuapp.com',
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ),
    );
    Get.put(
      UserStore(),
    );
  }
}
