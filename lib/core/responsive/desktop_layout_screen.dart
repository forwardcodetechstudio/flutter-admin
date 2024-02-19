import 'package:flutter/material.dart';
import 'package:flutter_admin/core/constants/app_button_styles.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_admin/core/widgets/app_drawer.dart';
import 'package:flutter_admin/core/widgets/shared_toolbar_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesktopLayoutScreen extends StatefulWidget {
  final Widget content;
  final String path;

  const DesktopLayoutScreen({
    super.key,
    required this.content,
    required this.path,
  });

  @override
  State<DesktopLayoutScreen> createState() => _DesktopLayoutScreenState();
}

class _DesktopLayoutScreenState extends State<DesktopLayoutScreen> {
  late bool _isDrawerCollasped;
  late bool _isHoverOnAppDrawer;

  @override
  void initState() {
    super.initState();
    _isDrawerCollasped = false;
    _isHoverOnAppDrawer = false;
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder searchFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        color: AppColors.backgroundf2f5fa,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.backgroundf2f5fa,
      body: Row(
        children: [
          MouseRegion(
            onEnter: (event) {
              setState(() {
                _isHoverOnAppDrawer = true;
              });
            },
            onExit: (event) {
              setState(() {
                _isHoverOnAppDrawer = false;
              });
            },
            child: AppDrawer(
              collapsed: _isHoverOnAppDrawer ? false : _isDrawerCollasped,
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: kToolbarHeight,
                  color: AppColors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isDrawerCollasped = !_isDrawerCollasped;
                          });
                        },
                        style: AppButtonStyles.primaryIcon,
                        icon: SvgPicture.asset(
                          AppImages.collapse,
                          width: 20,
                          height: 20,
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(width: 6),
                      SizedBox(
                        width: 220,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            suffixIcon: const Icon(
                              Icons.search,
                              color: AppColors.grey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            fillColor: AppColors.backgroundf2f5fa,
                            filled: true,
                            border: searchFieldBorder,
                            enabledBorder: searchFieldBorder,
                            focusedBorder: searchFieldBorder,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const SharedToolbarItems()
                    ],
                  ),
                ),
                Expanded(
                  child: widget.content,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
