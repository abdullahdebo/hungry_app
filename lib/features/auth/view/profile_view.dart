import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/custom_user_text_field.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _adress = TextEditingController();

  @override
  void initState() {
    _name.text = 'Abdullah';
    _email.text = 'abdo@gmail.com';
    _adress.text = 'Dammam - Ksa';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Root()),
            );
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 0,
            ),
            child: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://i.ibb.co/bR7wVVYS/sonic.png',
                      ),
                    ),
                    border: Border.all(
                      width: 4,
                      color: Colors.white,
                    ),

                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Gap(20),
              CustomUserTextField(
                controller: _name,
                lable: 'Name',
              ),
              Gap(20),
              CustomUserTextField(
                controller: _email,
                lable: 'Email',
              ),
              Gap(20),
              CustomUserTextField(
                controller: _adress,
                lable: 'Adress',
              ),
              Gap(20),
              Divider(),
              Gap(20),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                tileColor: Color(0xffF3F4F6),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                leading: Image.asset(
                  'assets/icon/visa.png',
                  width: 50,
                  color: Colors.blue.shade900,
                ),
                title: CustomText(
                  text: 'Debit card',
                  color: Colors.black,
                ),
                subtitle: CustomText(
                  text: '**** **** **** 2376',
                  color: Colors.black,
                ),
                trailing: CustomText(
                  text: 'Default',
                  color: Colors.black,
                  size: 14,
                ),
              ),
              Gap(250),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Edit Profile',
                      color: Colors.white,
                    ),
                    Gap(5),
                    Icon(
                      CupertinoIcons.pencil,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    CustomText(
                      text: 'Log out',
                      color: AppColors.primaryColor,
                    ),
                    Gap(5),
                    Icon(
                      Icons.logout,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
