part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState(this.themeMode);

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];

  ThemeState? fromJson(Map<String, dynamic> json) {
    final index = toInt(json["themeMode"]);
    final thememode = ThemeMode.values[index];
    // if (thememode case ThemeMode.system) {
    //   const SystemTheme();
    // } else

    if (thememode case ThemeMode.light) {
      return const LightTheme();
    } else if (thememode case ThemeMode.dark) {
      return const DarkTheme();
    }

    return null;
  }

  Map<String, dynamic>? toJson() {
    return {
      "themeMode": themeMode.index,
    };
  }
}

// final class SystemTheme extends ThemeState {
//   const SystemTheme() : super(ThemeMode.system);
// }

final class LightTheme extends ThemeState {
  const LightTheme() : super(ThemeMode.light);
}

final class DarkTheme extends ThemeState {
  const DarkTheme() : super(ThemeMode.dark);
}
