import 'package:expensetracker/Reposetory/UserProfileReposetory.dart';
import 'package:expensetracker/presentation/UserProfileScreen/Model/UserModel.dart';
import 'package:get/get.dart';


class UserController extends GetxController {
  var user = UserModel(username: '', profileImageUrl: '').obs;
  final UserRepository repository;

  UserController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async {
    user.value = await repository.fetchUser();
  }
}
