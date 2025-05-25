import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pmsn2025/utils/app_styles.dart';
import 'package:pmsn2025/utils/size_config.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int quantity1 = 4;
  int quantity2 = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: white1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white1,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: SizeConfig.blockSizeVertical! * 5,
                width: SizeConfig.blockSizeVertical! * 5,
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white1,
                  border: Border.all(
                    color: grey3,
                    width: 1.5,
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/figma/arrow_back_icon.svg',
                ),
              ),
            ),
            Text(
              'Checkout',
              style: encodeSansBold.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                color: grey10,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: SizeConfig.blockSizeVertical! * 5,
                width: SizeConfig.blockSizeVertical! * 5,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white1,
                  border: Border.all(
                    color: grey3,
                    width: 1.5,
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/figma/options_icon.svg',
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(paddingHorizontal),
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/figma/images/image-01.png',
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Modern light clothes',
                      style: encodeSansSemibold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        color: grey10,
                      ),
                    ),
                    Text(
                      'Dress modern',
                      style: encodeSansRegular.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        color: grey6,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$212.99',
                      style: encodeSansSemibold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: grey10,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (quantity1 > 0) {
                        setState(() {
                          quantity1--;
                        });
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey5, width: 1),
                        shape: BoxShape.circle,
                        color: white1,
                      ),
                      child: const Icon(Icons.remove, size: 18),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    quantity1.toString(),
                    style: encodeSansBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: grey13,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity1++;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey5, width: 1),
                        shape: BoxShape.circle,
                        color: white1,
                      ),
                      child: const Icon(Icons.add, size: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/figma/images/image-02.png',
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Modern light clothes',
                      style: encodeSansSemibold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        color: grey10,
                      ),
                    ),
                    Text(
                      'Dress modern',
                      style: encodeSansRegular.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                        color: grey6,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$162.99',
                      style: encodeSansSemibold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        color: grey10,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Divider(height: 20),
                  GestureDetector(
                    onTap: () {
                      if (quantity2 > 0) {
                        setState(() {
                          quantity2--;
                        });
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey5, width: 1),
                        shape: BoxShape.circle,
                        color: white1,
                      ),
                      child: const Icon(Icons.remove, size: 18),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    quantity2.toString(),
                    style: encodeSansBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                      color: grey13,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity2++;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey5, width: 1),
                        shape: BoxShape.circle,
                        color: white1,
                      ),
                      child: const Icon(Icons.add, size: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Shipping Information',
            style: encodeSansSemibold.copyWith(
              fontSize: SizeConfig.blockSizeHorizontal! * 4,
              color: grey10,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: grey2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.credit_card, size: 32),
                const SizedBox(width: 12),
                Text(
                  '**** **** **** 2143',
                  style: encodeSansRegular.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    color: grey13,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total (9 items)',
                style: encodeSansRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: grey13,
                ),
              ),
              Text(
                '\$1,014.95',
                style: encodeSansSemibold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: grey9,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Fee',
                style: encodeSansRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: grey13,
                ),
              ),
              Text(
                '\$0.00',
                style: encodeSansSemibold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: grey9,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
                style: encodeSansRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: grey13,
                ),
              ),
              Text(
                '\$0.00',
                style: encodeSansSemibold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: grey9,
                ),
              ),
            ],
          ),
          const Divider(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub Total',
                style: encodeSansSemibold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: grey10,
                ),
              ),
              Text(
                '\$1,014.95',
                style: encodeSansSemibold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                  color: grey10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: grey13,
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Pay',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
