import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/home/widget/card_item.dart';
import 'package:hungry_app/shared/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ['All', 'Compo', 'Sliders', 'Classic'];
  List itemsImage = [
    'assets/splash/test.png',
    'assets/splash/test1.png',
    'assets/splash/test2.png',
    'assets/splash/test3.png',
    'assets/splash/test1.png',
    'assets/splash/test2.png',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(20),

                  /// Header
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/logo/logo.svg',
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                            height: 40,
                          ),
                          Gap(7),
                          CustomText(
                            text: 'Hello , Abdullah',
                            size: 18,
                            weight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ],
                      ),
                      Spacer(),
                      CircleAvatar(radius: 30),
                    ],
                  ),
                  Gap(15),

                  /// search bar
                  Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: TextStyle(letterSpacing: 2),
                        prefixIcon: Icon(CupertinoIcons.search),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(15),

                  /// category
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(category.length, (
                          index,
                        ) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 28),
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade200,
                                borderRadius:
                                    BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              child: CustomText(
                                text: category[index],
                                color: selectedIndex == index
                                    ? Colors.white
                                    : AppColors.primaryColor,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  ///card item
                  Gap(15),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 15,
                        ),
                    itemBuilder: (context, index) {
                      return CardItem(
                        image: itemsImage[index],
                        name: 'Cheesburger',
                        desc: 'Wendy"s Burger',
                        rate: '⭐️ 4.9',
                      );
                    },
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
