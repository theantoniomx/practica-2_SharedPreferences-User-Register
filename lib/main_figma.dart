import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmsn2025/app_styles.dart';
import 'package:pmsn2025/size_config.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
  List<String> images = [
    'image-01',
    'image-02',
    'image-03',
    'image-04',
    'image-05'
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
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
                      style: kEncodeSansRegular.copyWith(
                        color: grey4,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    Text(
                      'Albert Stevano',
                      style: kEncodeSansBold.copyWith(
                        color: grey10,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: kGrey,
                  backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/29.jpg'),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Material(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: kEncodeSansRegular.copyWith(
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
                        hintStyle: kEncodeSansRegular.copyWith(
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
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: SvgPicture.asset('assets/figma/filter_icon.svg'),
                )
              ],
            ),
          )),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      categories[index] = categories[index];
                    });
                  },
                  child: Container(
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
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
