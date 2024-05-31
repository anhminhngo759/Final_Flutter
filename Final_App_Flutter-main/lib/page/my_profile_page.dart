import 'dart:io';
import 'package:final_app_flutter/components/app_bar.dart';
import 'package:final_app_flutter/model/account_model.dart';
import 'package:final_app_flutter/page/chage_password.dart';
import 'package:final_app_flutter/page/login_page.dart';
import 'package:final_app_flutter/resources/app_color.dart';
import 'package:final_app_flutter/services/shared_prefs.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final SharedPrefs _prefs = SharedPrefs();
  AccountModel account = AccountModel();
  File? _image;
  double size = 30.0;

  @override
  void initState() {
    super.initState();
    loadSavedImage();
  }

  Future<void> loadSavedImage() async {
    final imagePath = await _prefs.getImagePath();

    if (imagePath != null && imagePath.isNotEmpty) {
      final imageFile = File(imagePath);
      setState(() {
        _image = imageFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TdAppBar(
        showAvatar: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: size * 2,
              height: size * 2,
              child: _image != null
                  ? Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/avt.png',
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 16.0),
            Text(account.emailAddress ?? 'No Email'),
            SizedBox(height: 16.0),
            Container(
              color: Colors.grey[300],
              child: ListTile(
                leading: Icon(Icons.lock),
                title: Text(
                  'Change Password',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ChangePassword(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              color: Colors.grey[300],
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const Text('Do you want to Log out?'),
                        title: Row(
                          children: const [
                            Icon(
                              Icons.emoji_emotions,
                              color: AppColor.brown,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Log out!',
                              style: TextStyle(
                                color: AppColor.brown,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              accountList1.clear();
                              _prefs.addAccount(accountList1);
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: const Text('Yes 😭'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No 🥰'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
