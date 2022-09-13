import 'package:mobx/mobx.dart';
import 'package:nu_bank_clone/core/entities/login/user.dart';
part 'user_store.g.dart';

class UserStore = IUserStore with _$UserStore;

abstract class IUserStore with Store {
  @observable
  User user = User.empty();

  @action
  void addUser(User model) {
    if (model.cpf != '' && model.fullName != '') {
      user = model;
    }
  }

  @action
  void removeUser() {
    user = User.empty();
  }
}
