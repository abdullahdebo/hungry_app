import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';
import 'package:hungry_app/features/auth/view/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_user_text_field.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _adress = TextEditingController();
  final TextEditingController _visa = TextEditingController();

  UserModel? userModel;

  AuthRepo authRepo = AuthRepo();

  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      setState(() {
        userModel = user;
      });
    } catch (e) {
      String errorMsg = 'Error in profile ';
      if (e is ApiError) {
        errorMsg = e.message;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(customSnack(errorMsg));
    }
  }

  @override
  void initState() {
    getProfileData().then((v) {
      _name.text = userModel?.name.toString() ?? 'ABDULLAH';
      _email.text =
          userModel?.email.toString() ?? 'abdo@gmail.com';
      _adress.text = userModel?.address.toString() == ''
          ? 'Dammam - Ksa'
          : userModel!.address!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 70,
      color: AppColors.primaryColor,
      backgroundColor: Colors.white,
      onRefresh: () async {
        await getProfileData();
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            toolbarHeight: 30,
            backgroundColor: AppColors.primaryColor,
            scrolledUnderElevation: 0.0,
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
              child: Skeletonizer(
                enabled: userModel == null,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image:
                              userModel?.image != null &&
                                  userModel!.image!.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(
                                    userModel!.image!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),

                          color: Colors.grey.shade500,
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
                    userModel?.visa == ''
                        ? CustomUserTextField(
                            textInputType: TextInputType.number,
                            controller: _visa,
                            lable: 'ADD VISA CARD ',
                          )
                        : ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusGeometry.circular(
                                    8,
                                  ),
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
                              text:
                                  userModel?.visa ??
                                  '**** **** **** 8926',
                              color: Colors.black,
                            ),
                            trailing: CustomText(
                              text: 'Default',
                              color: Colors.black,
                              size: 14,
                            ),
                          ),
                    Gap(20),

                    Gap(275),
                  ],
                ),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LoginView(),
                              ),
                            );
                          },
                          child: CustomText(
                            text: 'Log out',
                            color: AppColors.primaryColor,
                          ),
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
        ),
      ),
    );
  }
}
