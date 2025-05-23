import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:pmsn2025/utils/app_styles.dart';
import 'package:pmsn2025/screens/product_detail.dart';
import 'package:pmsn2025/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ['All Items', 'Dress', 'T-shirt', 'Jeans'];
  List<String> icons = [
    'all_items_icon',
    'dress_icon',
    'tshirt_icon',
    'jeans_icon'
  ];
  List<String> images = ['image-01', 'image-02', 'image-03', 'image-04'];
  List<bool> isFavorite = [false, false, false, false];
  List<String> titles = [
    "Modern Light Clothes",
    "Light Dress Bless",
  ];

  List<String> subtitles = [
    "T-Shirt",
    "Dress modern",
  ];

  List<String> prices = [
    "\$212.99",
    "\$162.99",
  ];

  int current = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Práctica 1 - Figma Challenge',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, Welcome 👋',
                      style: encodeSansRegular.copyWith(
                        color: grey4,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    Text(
                      'Albert Stevano',
                      style: encodeSansBold.copyWith(
                        color: grey10,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: grey4,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: encodeSansRegular.copyWith(
                        color: grey5,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 13,
                          ),
                          prefixIcon: const IconTheme(
                            data: IconThemeData(
                              color: grey6,
                            ),
                            child: Icon(Icons.search),
                          ),
                          hintText: 'Search clothes. . . ',
                          border: kInputBorder,
                          errorBorder: kInputBorder,
                          focusedBorder: kInputBorder,
                          disabledBorder: kInputBorder,
                          focusedErrorBorder: kInputBorder,
                          enabledBorder: kInputBorder,
                          hintStyle: encodeSansRegular.copyWith(
                            color: grey6,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 49,
                    width: 49,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: grey13,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: SvgPicture.asset('assets/figma/filter_icon.svg'),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? paddingHorizontal : 15,
                      right: index == categories.length - 1
                          ? paddingHorizontal
                          : 0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    height: 36,
                    decoration: BoxDecoration(
                      color: current == index ? grey13 : white1,
                      borderRadius: BorderRadius.circular(8),
                      border: current == index
                          ? null
                          : Border.all(
                              color: grey5,
                              width: 1,
                            ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          current == index
                              ? 'assets/figma/${icons[index]}_selected.svg'
                              : 'assets/figma/${icons[index]}_unselected.svg',
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          categories[index],
                          style: encodeSansMedium.copyWith(
                            color: current == index ? white1 : grey13,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 23,
            itemCount: images.length,
            padding: const EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
            ),
            itemBuilder: (context, index) {
              final i = index % titles.length;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductDetail(),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(borderRadius),
                            child: Image.asset(
                              'assets/figma/images/${images[index]}.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite[index] = !isFavorite[index];
                            });
                          },
                          child: SvgPicture.asset(
                            isFavorite[index]
                                ? 'assets/figma/favorite_cloth_icon_selected.svg'
                                : 'assets/figma/favorite_cloth_icon_unselected.svg',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    titles[i],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: encodeSansSemibold.copyWith(
                      color: grey10,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                  ),
                  Text(
                    subtitles[i],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: encodeSansRegular.copyWith(
                      color: grey4,
                      fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        prices[i],
                        style: encodeSansSemibold.copyWith(
                          color: grey13,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: yellow1, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            '5.0',
                            style: encodeSansRegular.copyWith(
                              color: grey13,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 64,
        child: CustomNavigationBar(
          isFloating: true,
          borderRadius: const Radius.circular(40),
          selectedColor: white1,
          unSelectedColor: grey3,
          backgroundColor: grey13,
          strokeColor: Colors.transparent,
          scaleFactor: 0.1,
          iconSize: 40,
          items: [
            CustomNavigationBarItem(
              icon: _currentIndex == 0
                  ? SvgPicture.asset('assets/figma/home_icon_selected.svg')
                  : SvgPicture.asset('assets/figma/home_icon_unselected.svg'),
            ),
            CustomNavigationBarItem(
              icon: _currentIndex == 1
                  ? SvgPicture.asset('assets/figma/cart_icon_selected.svg')
                  : SvgPicture.asset('assets/figma/cart_icon_unselected.svg'),
            ),
            CustomNavigationBarItem(
              icon: _currentIndex == 2
                  ? SvgPicture.asset('assets/figma/favorite_icon_selected.svg')
                  : SvgPicture.asset(
                      'assets/figma/favorite_icon_unselected.svg'),
            ),
            CustomNavigationBarItem(
              icon: _currentIndex == 3
                  ? SvgPicture.asset('assets/figma/account_icon_selected.svg')
                  : SvgPicture.asset(
                      'assets/figma/account_icon_unselected.svg'),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
