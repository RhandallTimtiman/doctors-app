import 'package:consumer_app/app/core/constants/themes/theme_provider.dart';
import 'package:consumer_app/app/data/interfaces/interface.dart';
import 'package:flutter/material.dart';

class AppThemeColor {
  final ThemeType _themeType;
  AppThemeColor(this._themeType);

  ThemeColors getColors() {
    if (_themeType == ThemeType.dark) {
      return DarkColors();
    } else {
      return LightColors();
    }
  }
}

class LightColors extends ThemeColors {
  LightColors()
      : super(
          primary: const Color.fromRGBO(
            73,
            130,
            61,
            1,
          ),
          secondary: const Color(0xFF696969),
          background: const Color(0xffF2F2F2),
          mainBackground: Colors.white,
          primaryTextColor: Colors.black,
        );
}

//  const Color.fromRGBO(
//       73,
//       130,
//       61,
//       1,
//     );
class DarkColors extends ThemeColors {
  DarkColors()
      : super(
          primary: const Color(0xFF0DA068),
          secondary: const Color(0xFFFCFCFC),
          background: const Color(0xFF252525),
          mainBackground: const Color(
            0xFF2d2d2d,
          ),
          primaryTextColor: Colors.white,
        );
}
