import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';
import 'package:court_click_movie_dicovery_app/application/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile {
  final String id;
  final String name;
  final String avatarAsset;
  final bool isAddButton;

  const UserProfile({
    required this.id,
    required this.name,
    required this.avatarAsset,
    this.isAddButton = false,
  });
}

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({super.key});

  static const routeName = 'user_selection';

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  bool _isEditing = false;

  final List<UserProfile> _profiles = const [
    UserProfile(id: '1', name: 'Emenalo', avatarAsset: AppAssets.user1),
    UserProfile(id: '2', name: 'Onyeka', avatarAsset: AppAssets.user2),
    UserProfile(id: '3', name: 'Thelma', avatarAsset: AppAssets.user3),
    UserProfile(id: '4', name: 'Kids', avatarAsset: AppAssets.kids),
    UserProfile(
      id: '5',
      name: 'Add Profile',
      avatarAsset: AppAssets.add,
      isAddButton: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Image.asset(
          AppAssets.logo,
          height: 30.h,
          color: ColorResources.secondary,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
            icon: Icon(
              _isEditing ? Icons.check : Icons.edit,
              color: ColorResources.white,
              size: 22.sp,
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: SizedBox(
                  width: 250.w,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 30.w,
                    runSpacing: 36.h,
                    children: _profiles.map((profile) {
                      return _buildProfileItem(profile);
                    }).toList(),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(UserProfile profile) {
    return GestureDetector(
      onTap: () {
        if (profile.isAddButton) {
          // Action for adding profile
        } else {
          // Action for selecting profile
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 110.w,
                height: 110.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: _buildAvatarContent(profile),
              ),
              if (_isEditing && !profile.isAddButton)
                Container(
                  width: 110.w,
                  height: 110.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: ColorResources.black.withValues(alpha: 0.5),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.edit,
                      color: ColorResources.white,
                      size: 28.sp,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            profile.name,
            style: TextStyle(
              color: ColorResources.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarContent(UserProfile profile) {
    if (profile.isAddButton) {
      return Center(
        child: Container(
          width: 58.w,
          height: 58.w,
          decoration: const BoxDecoration(
            color: ColorResources.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(12.w),
          child: Image.asset(profile.avatarAsset, fit: BoxFit.contain),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Image.asset(
        profile.avatarAsset,
        width: 110.w,
        height: 110.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
