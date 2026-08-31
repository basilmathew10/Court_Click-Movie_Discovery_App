import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/app_assets.dart';

class ReferralCardWidget extends StatelessWidget {
  final VoidCallback? onCopyLinkTap;
  final VoidCallback? onShareWhatsAppTap;
  final VoidCallback? onShareFacebookTap;
  final VoidCallback? onShareGmailTap;
  final VoidCallback? onShareMoreTap;

  const ReferralCardWidget({
    super.key,
    this.onCopyLinkTap,
    this.onShareWhatsAppTap,
    this.onShareFacebookTap,
    this.onShareGmailTap,
    this.onShareMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1E1E1E),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Speech Bubble Icon + Title
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.chat,
                height: 22,
                width: 22,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              const Text(
                'Tell friends about Netflix.',
                style: TextStyle(
                  color: ColorResources.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          gap10,

          // Description Paragraph
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.',
            style: TextStyle(
              color: ColorResources.secondaryGrey,
              fontSize: 12.5,
              height: 1.4,
            ),
          ),
          gap10,

          // Terms & Conditions Underlined Link
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Terms & Conditions',
              style: TextStyle(
                color: ColorResources.secondaryGrey,
                fontSize: 12,
                decoration: TextDecoration.underline,
                decorationColor: ColorResources.secondaryGrey,
              ),
            ),
          ),
          gap16,

          // Link Copy Box Row (with gap between black box and Copy Link button)
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: Colors.white24, width: 0.8),
                  ),
                ),
              ),
              gap10,
              GestureDetector(
                onTap: onCopyLinkTap,
                child: Container(
                  height: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: ColorResources.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Center(
                    child: Text(
                      'Copy Link',
                      style: TextStyle(
                        color: ColorResources.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          gap20,

          // Social Share Buttons Row with Vertical Dividers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildShareOption(
                iconAsset: AppAssets.whatsapp,
                onTap: onShareWhatsAppTap,
              ),
              _buildVerticalDivider(),
              _buildShareOption(
                iconAsset: AppAssets.facebook,
                onTap: onShareFacebookTap,
              ),
              _buildVerticalDivider(),
              _buildShareOption(
                iconAsset: AppAssets.gmail,
                onTap: onShareGmailTap,
              ),
              _buildVerticalDivider(),
              _buildShareOption(
                iconAsset: AppAssets.more1,
                onTap: onShareMoreTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShareOption({required String iconAsset, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconAsset,
        height: 36,
        width: 36,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(width: 1, height: 36, color: Colors.white12);
  }
}
