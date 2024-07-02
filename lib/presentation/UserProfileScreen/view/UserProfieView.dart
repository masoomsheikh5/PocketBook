import 'package:expensetracker/presentation/UserProfileScreen/Controller/UserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(controller.user.value.profileImageUrl),
              ),
              SizedBox(height: 10),
              Text(
                controller.user.value.username,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.account_circle, color: Colors.purple),
                title: Text('Account'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.purple),
                title: Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.file_upload, color: Colors.purple),
                title: Text('Export Data'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        );
      }),
      
    );
  }
}
