import 'package:flutter/material.dart';

/// アプリケーションのカラースキーム定義
/// 
/// ライトテーマとダークテーマのカラースキームを提供します。
class AppColorScheme {
  // プライベートコンストラクタ（インスタンス化を防ぐ）
  AppColorScheme._();

  /// ライトテーマのカラースキーム
  static ColorScheme get light => ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
      );

  /// ダークテーマのカラースキーム
  static ColorScheme get dark => ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      );

  /// プライマリカラー
  static const Color primaryColor = Colors.blue;

  /// セカンダリカラー
  static const Color secondaryColor = Colors.blueAccent;

  /// エラーカラー
  static const Color errorColor = Colors.red;

  /// 成功カラー
  static const Color successColor = Colors.green;

  /// 警告カラー
  static const Color warningColor = Colors.orange;
}