import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmsn2025/screens/checkout_screen.dart';
import 'package:pmsn2025/utils/app_styles.dart';
import 'package:pmsn2025/utils/size_config.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _counter = 0;
  String selectedSize = 'L';
  bool isFavorite = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckoutScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: grey13,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/figma/shopping_cart_icon.svg',
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 2,
              ),
              RichText(
                text: TextSpan(
                  text: 'Add to Cart | \$162.99 ',
                  style: encodeSansBold.copyWith(
                    color: white1,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\$190.99',
                      style: encodeSansRegular.copyWith(
                        color: white1,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness:
                            SizeConfig.blockSizeHorizontal! * 1,
                        decorationColor: white1,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: 24,
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 60,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/figma/images/image_product_detail.png',
                        height: SizeConfig.blockSizeVertical! * 60,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: SizeConfig.blockSizeVertical! * 5,
                                width: SizeConfig.blockSizeVertical! * 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white1,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  'assets/figma/arrow_back_icon.svg',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: Container(
                                height: SizeConfig.blockSizeVertical! * 5,
                                width: SizeConfig.blockSizeVertical! * 5,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white1,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  isFavorite
                                      ? 'assets/figma/favorite_black_icon.svg'
                                      : 'assets/figma/favorite_black_icon_unselected.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Light Dress Bless',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: encodeSansSemibold.copyWith(
                        color: grey10,
                        fontSize: SizeConfig.blockSizeHorizontal! * 6,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _decrementCounter,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: grey5,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                            color: white1,
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: grey13,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                      Text(
                        '$_counter',
                        style: encodeSansBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          color: grey13,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                      GestureDetector(
                        onTap: _incrementCounter,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: grey5,
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                            color: white1,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: grey13,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: yellow1, size: 16),
                  const SizedBox(
                    width: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '5.0 ',
                      style: encodeSansRegular.copyWith(
                        color: grey13,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '(7.932 reviews)',
                          style: encodeSansRegular.copyWith(
                            color: blue1,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ReadMoreText(
                'Its simple and elegant shape makes it perfect for those of you who like you who want minimalist clothes',
                trimLines: 2,
                trimMode: TrimMode.Line,
                delimiter: ' ',
                trimCollapsedText: 'Read More...',
                trimExpandedText: ' Show Less',
                style: encodeSansRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: grey13,
                ),
                moreStyle: encodeSansBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: grey13,
                ),
                lessStyle: encodeSansBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: grey13,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                height: 1,
                color: grey3,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Choose Size',
                                style: encodeSansBold.copyWith(
                                  color: grey10,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: ['S', 'M', 'L', 'XL'].map((size) {
                                  final bool isSelected = selectedSize == size;
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      right:
                                          SizeConfig.blockSizeHorizontal! * 1,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSize = size;
                                        });
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.blockSizeHorizontal! * 8,
                                        width:
                                            SizeConfig.blockSizeHorizontal! * 8,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isSelected ? grey13 : grey3,
                                            width: 1,
                                          ),
                                          shape: BoxShape.circle,
                                          color: isSelected ? grey13 : white1,
                                        ),
                                        child: Center(
                                          child: Text(
                                            size,
                                            style: isSelected
                                                ? encodeSansBold.copyWith(
                                                    color: white1,
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal! *
                                                        3.5,
                                                  )
                                                : encodeSansRegular.copyWith(
                                                    color: grey13,
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal! *
                                                        3.5,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: encodeSansBold.copyWith(
                          color: grey13,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 7.5,
                            width: SizeConfig.blockSizeHorizontal! * 7.5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: grey4,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 7.5,
                            width: SizeConfig.blockSizeHorizontal! * 7.5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: grey11,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 1,
                          ),
                          Container(
                            height: SizeConfig.blockSizeHorizontal! * 7.5,
                            width: SizeConfig.blockSizeHorizontal! * 7.5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: grey10,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
