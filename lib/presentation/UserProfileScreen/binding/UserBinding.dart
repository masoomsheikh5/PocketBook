import 'package:expensetracker/Reposetory/UserProfileReposetory.dart';
import 'package:expensetracker/presentation/UserProfileScreen/Controller/UserController.dart';
import 'package:get/get.dart';


class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(repository: UserRepository()));
  }
}
