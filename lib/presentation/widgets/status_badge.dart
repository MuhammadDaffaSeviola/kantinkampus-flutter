import 'package:flutter/material.dart';
import '../../app/theme/app_theme.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColors = theme.extension<AppStatusColors>();

    Color backgroundColor;
    Color foregroundColor;

    switch (status.toLowerCase()) {
      case 'selesai':
      case 'success':
        backgroundColor = (statusColors?.success ?? Colors.green).withValues(alpha: 0.12);
        foregroundColor = statusColors?.success ?? Colors.green;
        break;
      case 'diproses':
      case 'pending':
      case 'proses':
        backgroundColor = (statusColors?.warning ?? Colors.orange).withValues(alpha: 0.12);
        foregroundColor = statusColors?.warning ?? Colors.orange;
        break;
      case 'dibatalkan':
      case 'gagal':
      case 'cancelled':
        backgroundColor = theme.colorScheme.error.withValues(alpha: 0.12);
        foregroundColor = theme.colorScheme.error;
        break;
      default:
        backgroundColor = (statusColors?.info ?? theme.colorScheme.primary)
            .withValues(alpha: 0.12);
        foregroundColor = statusColors?.info ?? theme.colorScheme.primary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: theme.textTheme.bodySmall?.copyWith(
          color: foregroundColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
