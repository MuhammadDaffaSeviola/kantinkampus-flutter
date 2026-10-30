import 'package:flutter/material.dart';

import '../../data/models/menu.dart';

class MenuDetailView extends StatelessWidget {
  const MenuDetailView({
    super.key,
    required this.menu,
  });

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Menu'),
      ),
      body: SingleChildScrollView(
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
                        return _ImagePlaceholder(theme: theme);
                      },
                    )
                  : _ImagePlaceholder(theme: theme),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          menu.name,
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (!menu.isAvailable)
                        const Chip(
                          label: Text('Habis'),
                        ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Rp ${menu.price.toStringAsFixed(0)}',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Deskripsi',
                    style: theme.textTheme.titleMedium,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    menu.description,
                    style: theme.textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: menu.isAvailable ? () {} : null,
                      icon: const Icon(Icons.add_shopping_cart_outlined),
                      label: Text(
                        menu.isAvailable
                            ? 'Tambah ke Keranjang'
                            : 'Menu Tidak Tersedia',
                      ),
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

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.colorScheme.primaryContainer,
      child: Center(
        child: Icon(
          Icons.restaurant,
          size: 72,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
