import 'package:court_click_movie_dicovery_app/application/core/theme/diamentions.dart';
import 'package:flutter/material.dart';
import 'package:court_click_movie_dicovery_app/application/core/theme/colors.dart';

class SearchHeaderWidget extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onMicTap;

  const SearchHeaderWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      color: ColorResources.textFieldColor,
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: ColorResources.secondaryGrey,
            size: 24,
          ),
          gap10,
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(color: ColorResources.white, fontSize: 15),
              decoration: const InputDecoration(
                hintText: 'Search for a show, movie, genre, e.t.c.',
                hintStyle: TextStyle(
                  color: ColorResources.secondaryGrey,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          GestureDetector(
            onTap: onMicTap,
            child: const Icon(
              Icons.mic,
              color: ColorResources.secondaryGrey,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
