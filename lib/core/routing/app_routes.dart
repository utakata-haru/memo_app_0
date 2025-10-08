/// アプリケーションのルート定数
/// 
/// 型安全なルーティングのためのパスとルート名の定義
class AppRoutes {
  // プライベートコンストラクタ（インスタンス化を防ぐ）
  AppRoutes._();

  // ========================================
  // ルートパス定数
  // ========================================
  
  /// ホーム（メモ一覧）ページのパス
  static const String home = '/';
  
  /// メモ詳細ページのパス（パラメータ付き）
  static const String memoDetail = '/memo/:id';
  
  /// メモ作成ページのパス
  static const String memoCreate = '/memo/create';
  
  /// メモ編集ページのパス（パラメータ付き）
  static const String memoEdit = '/memo/:id/edit';

  // ========================================
  // ルート名定数
  // ========================================
  
  /// ホーム（メモ一覧）ページのルート名
  static const String homeName = 'home';
  
  /// メモ詳細ページのルート名
  static const String memoDetailName = 'memo_detail';
  
  /// メモ作成ページのルート名
  static const String memoCreateName = 'memo_create';
  
  /// メモ編集ページのルート名
  static const String memoEditName = 'memo_edit';

  // ========================================
  // パス生成ヘルパーメソッド
  // ========================================
  
  /// メモ詳細ページのパスを生成
  /// 
  /// [memoId] メモのID
  /// Returns: '/memo/{memoId}' 形式のパス
  static String generateMemoDetailPath(String memoId) {
    return '/memo/$memoId';
  }
  
  /// メモ編集ページのパスを生成
  /// 
  /// [memoId] メモのID
  /// Returns: '/memo/{memoId}/edit' 形式のパス
  static String generateMemoEditPath(String memoId) {
    return '/memo/$memoId/edit';
  }

  // ========================================
  // パラメータキー定数
  // ========================================
  
  /// メモIDのパラメータキー
  static const String memoIdParam = 'id';
}