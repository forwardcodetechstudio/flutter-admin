import 'package:flutter/material.dart';
import 'package:flutter_admin/config/theme/bloc/theme_bloc.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_drawer.dart';
import 'package:flutter_admin/core/widgets/custom_theme_changing_button.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesktopLayoutScreen extends StatefulWidget {
  final Widget content;

  const DesktopLayoutScreen({
    super.key,
    required this.content,
  });

  @override
  State<DesktopLayoutScreen> createState() => _DesktopLayoutScreenState();
}

class _DesktopLayoutScreenState extends State<DesktopLayoutScreen> {
  late bool _isDrawerCollasped;

  @override
  void initState() {
    super.initState();
    _isDrawerCollasped = false;
  }

  @override
  Widget build(BuildContext context) {
    final InputBorder searchFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        color: AppColors.backgroundf2f5fa,
      ),
    );
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final bool isLightThemeActive =
            (state as DefaultTheme).isLightThemeActive;
        return Scaffold(
          body: Row(
            children: [
              // Sidenav bar :::::::::::::::::::::
              AppDrawer(collapsed: _isDrawerCollasped),

              // Body with content and appbar :::::::::::::
              Flexible(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: kToolbarHeight,
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isDrawerCollasped = !_isDrawerCollasped;
                              });
                            },
                            child: SvgPicture.asset(
                              AppImages.collapse,
                              width: 20,
                              height: 20,
                              color: AppColors.grey,
                            ),
                          ),
                          14.sbw,
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
                                filled: isLightThemeActive,
                                border: searchFieldBorder,
                                enabledBorder: searchFieldBorder,
                                focusedBorder: searchFieldBorder,
                              ),
                            ),
                          ),
                          const Spacer(),
                          const CustomThemeChangingButton(),
                          8.sbw,
                          PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  child: ListTile(
                                    tileColor: Colors.transparent,
                                    title: Text('Welcome User'),
                                    trailing: Icon(Icons.person),
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    context
                                        .read<AuthBloc>()
                                        .add(AuthLogoutEvent());
                                  },
                                  child: const ListTile(
                                    tileColor: Colors.transparent,
                                    title: Text('Logout'),
                                    trailing: Icon(Icons.logout),
                                  ),
                                ),
                              ];
                            },
                          )
                        ],
                      ),
                    ),

                    // content of diffrent screen :::::::::::::::::::
                    Expanded(child: widget.content)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
