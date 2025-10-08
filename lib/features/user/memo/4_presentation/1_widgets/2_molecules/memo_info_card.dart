import 'package:flutter/material.dart';
import '../../../1_domain/1_entities/memo_entity.dart';

/// メモの詳細情報を表示するカードMoleculeコンポーネント
/// 
/// メモの内容やメタ情報を整理して表示します。
class MemoInfoCard extends StatelessWidget {
  /// 表示するメモ
  final MemoEntity memo;

  const MemoInfoCard({
    super.key,
    required this.memo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'メモ内容',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                memo.context,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// メモのメタ情報を表示するカードMoleculeコンポーネント
class MemoMetaCard extends StatelessWidget {
  /// 表示するメモ
  final MemoEntity memo;

  const MemoMetaCard({
    super.key,
    required this.memo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'メモ情報',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            // メモID
            _InfoRow(
              icon: Icons.fingerprint,
              label: 'ID',
              value: memo.id,
            ),
            
            const SizedBox(height: 8),
            
            // 作成日時
            if (memo.createdAt != null)
              _InfoRow(
                icon: Icons.access_time,
                label: '作成日時',
                value: _formatDate(memo.createdAt!),
              ),
            
            if (memo.createdAt != null && memo.updatedAt != null)
              const SizedBox(height: 8),
            
            // 更新日時
            if (memo.updatedAt != null)
              _InfoRow(
                icon: Icons.update,
                label: '更新日時',
                value: _formatDate(memo.updatedAt!),
              ),
          ],
        ),
      ),
    );
  }

  /// 日付のフォーマット
  String _formatDate(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')} '
           '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

/// 情報行を表示するプライベートウィジェット
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}