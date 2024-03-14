import 'package:flutter/material.dart';
import 'package:flutter_admin/config/routes/routes_constant.dart';
import 'package:flutter_admin/core/constants/app_colors.dart';
import 'package:flutter_admin/core/constants/app_images.dart';
import 'package:flutter_admin/core/extensions/empty_space.dart';
import 'package:flutter_admin/core/widgets/app_drawer.dart';
import 'package:flutter_admin/core/widgets/custom_theme_changing_button.dart';
import 'package:flutter_admin/features/authentication/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
        color: AppColors.whitef2f5fa,
      ),
    );

    // color for handling theme change
    final background = Theme.of(context).colorScheme.background;
    // final onBackground = Theme.of(context).colorScheme.background;

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
                                fillColor: background,
                                filled: true,
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
                                PopupMenuItem(
                                  child: ListTile(
                                    tileColor: Colors.transparent,
                                    title: const Text('Welcome User'),
                                    trailing: const Icon(Icons.person),
                                    onTap: () => context.goNamed(RoutesName.profile),
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
  }
}
