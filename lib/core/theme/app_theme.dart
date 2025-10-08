import 'package:flutter/material.dart';
import 'color_scheme.dart';
import 'component_themes.dart';

/// アプリケーションのメインテーマ定義
/// 
/// ライトテーマとダークテーマを提供し、
/// 各コンポーネントのテーマを統合します。
class AppTheme {
  // プライベートコンストラクタ（インスタンス化を防ぐ）
  AppTheme._();

  /// ライトテーマ
  static ThemeData get light => ThemeData(
        // カラースキーム
        colorScheme: AppColorScheme.light,
        useMaterial3: true,

        // コンポーネントテーマ
        appBarTheme: ComponentThemes.appBarTheme,
        cardTheme: ComponentThemes.cardTheme,
        elevatedButtonTheme: ComponentThemes.elevatedButtonTheme,
        outlinedButtonTheme: ComponentThemes.outlinedButtonTheme,
        textButtonTheme: ComponentThemes.textButtonTheme,
        inputDecorationTheme: ComponentThemes.inputDecorationTheme,
        floatingActionButtonTheme: ComponentThemes.floatingActionButtonTheme,

        // フォントファミリー（必要に応じて設定）
        fontFamily: 'NotoSansJP',

        // その他の設定
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  /// ダークテーマ
  static ThemeData get dark => ThemeData(
        // カラースキーム
        colorScheme: AppColorScheme.dark,
        useMaterial3: true,

        // コンポーネントテーマ
        appBarTheme: ComponentThemes.appBarTheme,
        cardTheme: ComponentThemes.cardTheme,
        elevatedButtonTheme: ComponentThemes.elevatedButtonTheme,
        outlinedButtonTheme: ComponentThemes.outlinedButtonTheme,
        textButtonTheme: ComponentThemes.textButtonTheme,
        inputDecorationTheme: ComponentThemes.inputDecorationTheme,
        floatingActionButtonTheme: ComponentThemes.floatingActionButtonTheme,

        // フォントファミリー（必要に応じて設定）
        fontFamily: 'NotoSansJP',

        // その他の設定
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}