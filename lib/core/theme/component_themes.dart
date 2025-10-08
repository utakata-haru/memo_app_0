import 'package:flutter/material.dart';

/// UIコンポーネント別のテーマ定義
/// 
/// AppBar、Card、Button等の各コンポーネントのテーマを提供します。
class ComponentThemes {
  // プライベートコンストラクタ（インスタンス化を防ぐ）
  ComponentThemes._();

  /// AppBarのテーマ
  static const AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 1,
  );

  /// Cardのテーマ
  static CardThemeData get cardTheme => CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      );

  /// ElevatedButtonのテーマ
  static ElevatedButtonThemeData get elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
      );

  /// OutlinedButtonのテーマ
  static OutlinedButtonThemeData get outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
        ),
      );

  /// TextButtonのテーマ
  static TextButtonThemeData get textButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      );

  /// InputDecorationのテーマ
  static InputDecorationTheme get inputDecorationTheme =>
      const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      );

  /// FloatingActionButtonのテーマ
  static const FloatingActionButtonThemeData floatingActionButtonTheme =
      FloatingActionButtonThemeData(
    shape: CircleBorder(),
  );
}