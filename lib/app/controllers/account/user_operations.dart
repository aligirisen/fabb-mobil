import 'package:fabb_mobil/app/models/user_model.dart';
import 'package:fabb_mobil/app/services/user_service.dart';

class UserOperations {
  Future<bool> deleteUser(User user) async {
    final accountId = user.accountId;
    final userId = user.userId;

    bool isDeleted = await UserService().deleteUser(accountId!, userId!);

    if (isDeleted) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateUser(User user) async {
    bool isUpdated = await UserService().updateUser(user);

    if (isUpdated) {
      return true;
    } else {
      return false;
    }
  }
}
