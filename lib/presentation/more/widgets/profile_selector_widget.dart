import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/app_assets.dart';

class ProfileItem {
  final String name;
  final String avatarAsset;
  final bool isAddButton;

  const ProfileItem({
    required this.name,
    required this.avatarAsset,
    this.isAddButton = false,
  });
}

class ProfileSelectorWidget extends StatelessWidget {
  final VoidCallback? onManageProfilesTap;

  static const List<ProfileItem> defaultProfiles = [
    ProfileItem(name: 'Emenalo', avatarAsset: AppAssets.user1),
    ProfileItem(name: 'Onyeka', avatarAsset: AppAssets.user2),
    ProfileItem(name: 'Thelma', avatarAsset: AppAssets.user3),
    ProfileItem(name: 'Kids', avatarAsset: AppAssets.kids),
    ProfileItem(name: '', avatarAsset: AppAssets.add, isAddButton: true),
  ];

  const ProfileSelectorWidget({super.key, this.onManageProfilesTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profiles Horizontal Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: defaultProfiles.map((p) => _buildProfileCard(p)).toList(),
        ),
        gap16,

        // Manage Profiles Button
        GestureDetector(
          onTap: onManageProfilesTap,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit_outlined,
                color: ColorResources.secondaryGrey,
                size: 16,
              ),
              SizedBox(width: 8),
              Text(
                'Manage Profiles',
                style: TextStyle(
                  color: ColorResources.secondaryGrey,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileCard(ProfileItem profile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: profile.isAddButton
                ? Border.all(color: ColorResources.cardColor, width: 1.5)
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: profile.isAddButton
                ? Container(
                    color: ColorResources.black,
                    child: const Icon(
                      Icons.add,
                      color: ColorResources.secondaryGrey,
                      size: 32,
                    ),
                  )
                : Image.asset(
                    profile.avatarAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: ColorResources.cardColor,
                        child: const Icon(
                          Icons.person,
                          color: ColorResources.white,
                        ),
                      );
                    },
                  ),
          ),
        ),
        gap6,
        if (profile.name.isNotEmpty)
          Text(
            profile.name,
            style: const TextStyle(
              color: ColorResources.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
