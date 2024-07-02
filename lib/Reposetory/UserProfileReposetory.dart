import 'package:expensetracker/presentation/UserProfileScreen/Model/UserModel.dart';



class UserRepository {
  // Example data fetching function
  Future<UserModel> fetchUser() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return UserModel(username: "Iriana Saliha", profileImageUrl: "https://example.com/profile.jpg");
  }
}
