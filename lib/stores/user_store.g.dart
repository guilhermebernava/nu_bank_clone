// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on IUserStore, Store {
  late final _$userAtom = Atom(name: 'IUserStore.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$IUserStoreActionController =
      ActionController(name: 'IUserStore', context: context);

  @override
  void addUser(User model) {
    final _$actionInfo =
        _$IUserStoreActionController.startAction(name: 'IUserStore.addUser');
    try {
      return super.addUser(model);
    } finally {
      _$IUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeUser() {
    final _$actionInfo =
        _$IUserStoreActionController.startAction(name: 'IUserStore.removeUser');
    try {
      return super.removeUser();
    } finally {
      _$IUserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
