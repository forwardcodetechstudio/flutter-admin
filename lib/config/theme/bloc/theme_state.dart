part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();
}

final class DefaultTheme extends ThemeState {
  final bool isLightThemeActive;
  const DefaultTheme({this.isLightThemeActive = true});

  @override
  List<Object> get props => [
        isLightThemeActive,
      ];
}
