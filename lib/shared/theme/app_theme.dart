import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const bool themeMaterial3 = true;
const ThemeMode themeModeDefault = ThemeMode.dark;
final String? themeFont = GoogleFonts.quicksand().fontFamily;

class AppTheme {
  static ThemeData get lightTheme {
    return FlexThemeData.light(
      colors: const FlexSchemeColor(
        primary: Color(0xffCB313F),
        primaryContainer: Color(0xffffffff),
        secondary: Color(0xff941D2E),
        secondaryContainer: Color(0xff2979ff),
        tertiary: Color(0xffF97315),
        tertiaryContainer: Color(0xffe9cfa1),
        appBarColor: Color(0xffffffff),
        error: Color(0xffb00020),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 8,
      appBarStyle: FlexAppBarStyle.surface,
      appBarElevation: 2.0,
      tooltipsMatchBackground: true,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        thinBorderWidth: 0.5,
        thickBorderWidth: 0.5,
        textButtonRadius: 5.0,
        filledButtonRadius: 5.0,
        elevatedButtonRadius: 5.0,
        outlinedButtonRadius: 5.0,
        outlinedButtonBorderWidth: 0.5,
        segmentedButtonRadius: 5.0,
        inputDecoratorSchemeColor: SchemeColor.secondaryContainer,
        inputDecoratorIsFilled: false,
        inputDecoratorUnfocusedBorderIsColored: false,
        inputDecoratorPrefixIconSchemeColor: SchemeColor.onPrimaryContainer,
        fabUseShape: true,
        fabAlwaysCircular: true,
        chipRadius: 5.0,
        cardRadius: 5.0,
        dialogRadius: 5.0,
        datePickerDialogRadius: 5.0,
        timePickerDialogRadius: 5.0,
        appBarScrolledUnderElevation: 0.5,
        bottomSheetRadius: 16.0,
        navigationBarLabelBehavior:
            NavigationDestinationLabelBehavior.alwaysHide,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      dialogBackground: Colors.white,
      swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
    ).copyWith(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      scaffoldBackgroundColor: Colors.white,
      listTileTheme: const ListTileThemeData(tileColor: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.black26),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.5)),
        filled: true,
        fillColor: Colors.white,
      ),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    );
  }

  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      colors: const FlexSchemeColor(
        primary: Color(0xffCB313F),
        primaryContainer: Color(0xff1a2c42),
        secondary: Color(0xff941D2E),
        secondaryContainer: Color(0xffd48608),
        tertiary: Color(0xfff4ca7e),
        tertiaryContainer: Color(0xffc68e2d),
        appBarColor: Color(0xffd48608),
        error: Color(0xffcf6679),
      ),
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      tooltipsMatchBackground: true,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        useTextTheme: true,
        thinBorderWidth: 0.5,
        thickBorderWidth: 0.5,
        textButtonRadius: 5.0,
        filledButtonRadius: 5.0,
        elevatedButtonRadius: 5.0,
        outlinedButtonRadius: 5.0,
        outlinedButtonBorderWidth: 0.5,
        segmentedButtonRadius: 5.0,
        inputDecoratorIsFilled: false,
        inputDecoratorUnfocusedBorderIsColored: false,
        fabUseShape: true,
        fabAlwaysCircular: true,
        chipRadius: 5.0,
        cardRadius: 5.0,
        dialogRadius: 8.0,
        datePickerDialogRadius: 8.0,
        timePickerDialogRadius: 8.0,
        bottomSheetRadius: 16.0,
        navigationBarLabelBehavior:
            NavigationDestinationLabelBehavior.alwaysHide,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
    ).copyWith(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.black12,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.black26),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5)),
          filled: true,
          fillColor: Colors.white,
        ));
  }
}
