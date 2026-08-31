import 'package:court_click_movie_dicovery_app/application/core/theme/text_styles.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/extentions.dart';
import 'package:court_click_movie_dicovery_app/presentation/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';

class DownloadMainScreen extends StatelessWidget {
  const DownloadMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap12,
                // Top Header: Smart Downloads
                const Row(
                  children: [
                    gap12,
                    Text(
                      'Smart Downloads',
                      style: TextStyle(
                        color: ColorResources.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                gap30,

                // Title Header
                const Text(
                  'Introducing Downloads For You',
                  style: TextStyle(
                    color: ColorResources.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
                gap12,

                // Description Paragraph
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.',
                  style: TextStyle(
                    color: ColorResources.secondaryGrey,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
                gap30,

                // Center Illustration Circle Graphic
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorResources.cardColor,
                    ),
                  ),
                ),
                gap48,

                // Primary Button: SETUP
                CommonButton(
                  text: 'SETUP',
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(4),
                ),
                gap60,

                // Secondary Button: Find Something to Download
                Center(
                  child: CommonButton(
                    text: 'Find Something to Download',
                    onPressed: () {},
                    borderRadius: BorderRadius.circular(4),
                    backgroundColor: ColorResources.cardColor,
                    height: 42,
                    width: 255,
                    textStyle: context.textStyle1.s12.w600.copyWith(
                      color: ColorResources.white,
                    ),
                  ),
                ),
                gap48,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
