import 'package:flutter/material.dart';
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
        body: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      prefix: const IconTheme(
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
              )
            ],
          ))
        ],
      ),
    );
  }
}
