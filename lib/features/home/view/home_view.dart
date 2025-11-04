import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/home/widget/card_item.dart';
import 'package:hungry_app/features/home/widget/search_field.dart';
import 'package:hungry_app/features/home/widget/user_header.dart';
import 'package:hungry_app/features/product/view/product_details_view.dart';
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
                  UserHeader(),
                  Gap(15),
                  SearchField(),
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) {
                                return ProductDetailsView();
                              },
                            ),
                          );
                        },
                        child: CardItem(
                          image: itemsImage[index],
                          name: 'Cheesburger',
                          desc: 'Wendy"s Burger',
                          rate: '⭐️ 4.9',
                        ),
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
