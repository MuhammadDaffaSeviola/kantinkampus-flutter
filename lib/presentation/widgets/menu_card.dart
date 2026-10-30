import 'package:flutter/material.dart';

import '../../data/models/menu.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.menu,
    this.onTap,
  });

  final Menu menu;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: menu.imageUrl.isNotEmpty
                  ? Image.network(
                      menu.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: theme.colorScheme.primaryContainer,
                          child: Icon(
                            Icons.restaurant,
                            size: 48,
                            color: theme.colorScheme.primary,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: theme.colorScheme.primaryContainer,
                      child: Icon(
                        Icons.restaurant,
                        size: 48,
                        color: theme.colorScheme.primary,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          menu.name,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (!menu.isAvailable)
                        const Chip(
                          label: Text('Habis'),
                          visualDensity: VisualDensity.compact,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    menu.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Rp ${menu.price.toStringAsFixed(0)}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
