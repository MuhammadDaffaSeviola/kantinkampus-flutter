import 'package:flutter/material.dart';

import '../../data/models/menu.dart';
import '../widgets/menu_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const List<Menu> _menus = [
    Menu(
      id: '1',
      name: 'Nasi Goreng',
      description: 'Nasi goreng spesial dengan telur dan ayam.',
      price: 15000,
      imageUrl: '',
      categoryId: 'makanan',
      isAvailable: true,
    ),
    Menu(
      id: '2',
      name: 'Mie Goreng',
      description: 'Mie goreng dengan sayuran dan telur.',
      price: 13000,
      imageUrl: '',
      categoryId: 'makanan',
      isAvailable: true,
    ),
    Menu(
      id: '3',
      name: 'Ayam Geprek',
      description: 'Ayam crispy dengan sambal geprek khas.',
      price: 18000,
      imageUrl: '',
      categoryId: 'makanan',
      isAvailable: true,
    ),
    Menu(
      id: '4',
      name: 'Es Teh',
      description: 'Minuman teh manis dingin yang menyegarkan.',
      price: 5000,
      imageUrl: '',
      categoryId: 'minuman',
      isAvailable: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('KantinKampus'),
        actions: [
          IconButton(
            tooltip: 'Keranjang',
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mau makan apa hari ini?',
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Pilih makanan dan minuman favoritmu.',
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari makanan atau minuman',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    tooltip: 'Filter',
                    onPressed: () {},
                    icon: const Icon(Icons.tune),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'Kategori',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 12),

              SizedBox(
                height: 42,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _CategoryChip(
                      label: 'Semua',
                      icon: Icons.restaurant_menu,
                      selected: true,
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                    _CategoryChip(
                      label: 'Makanan',
                      icon: Icons.restaurant,
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                    _CategoryChip(
                      label: 'Minuman',
                      icon: Icons.local_drink_outlined,
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                    _CategoryChip(
                      label: 'Snack',
                      icon: Icons.fastfood_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu Pilihan',
                    style: theme.textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Lihat semua'),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _menus.length,
                gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 320,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return MenuCard(
                    menu: _menus[index],
                    onTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.onTap,
    this.selected = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilterChip(
      selected: selected,
      onSelected: (_) => onTap(),
      avatar: Icon(
        icon,
        size: 18,
        color: selected
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurfaceVariant,
      ),
      label: Text(label),
    );
  }
}
