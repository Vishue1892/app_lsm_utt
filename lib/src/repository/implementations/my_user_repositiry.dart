import 'dart:io';

import 'package:app_languagesing/src/model/user.dart';
import 'package:app_languagesing/src/provider/provider.dart';
import 'package:app_languagesing/src/repository/my_user_repository.dart';

class MyUserRepository extends MyUserRepositoryBase {
  final provider = FirebaseProvider();

  @override
  Future<MyUser?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(MyUser user, File? image) =>
      provider.saveMyUser(user, image);
}
