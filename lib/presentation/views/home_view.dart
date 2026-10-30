import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/menu.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const List<Menu> _menus = [
    Menu(
      id: '1',
      name: 'Nasi Goreng Spesial',
      description:
          'Nasi goreng bumbu gurih dengan telur mata sapi, acar segar, dan kerupuk.',
      price: 15000,
      imageUrl:
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=600&q=80',
      categoryId: 'makanan',
      isAvailable: true,
    ),
    Menu(
      id: '2',
      name: 'Ayam Geprek Sambal Bawang',
      description:
          'Ayam krispi renyah dengan sambal bawang yang pedas dan gurih.',
      price: 15000,
      imageUrl:
          'https://images.unsplash.com/photo-1606756790138-261d2b21cd75?auto=format&fit=crop&w=600&q=80',
      categoryId: 'makanan',
      isAvailable: true,
    ),
    Menu(
      id: '3',
      name: 'Es Teh Jumbo Segar',
      description:
          'Teh manis dingin yang menyegarkan untuk menemani aktivitas kampus.',
      price: 4000,
      imageUrl:
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=600&q=80',
      categoryId: 'minuman',
      isAvailable: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 18),
                        _buildGreeting(),
                        const SizedBox(height: 18),
                        _buildBalanceCard(),
                        const SizedBox(height: 20),
                        _buildSearch(),
                        const SizedBox(height: 20),
                        _buildTips(),
                        const SizedBox(height: 20),
                        _buildCategories(),
                        const SizedBox(height: 24),
                        _buildDensitySection(),
                        const SizedBox(height: 26),
                        _buildPopularSection(context),
                        const SizedBox(height: 24),
                        _buildEcoBanner(),
                      ],
                    ),
                  ),
                ),
                _buildBottomNavigation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'KantinKampus',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Color(0xFF172033),
              ),
            ),
            const SizedBox(height: 1),
            Text(
              'Beranda',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Color(0xFF374151),
            size: 23,
          ),
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Halo, Daffa 👋',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: Color(0xFF172033),
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Fakultas Ilmu Komputer •',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF697386),
          ),
        ),
        Text(
          'Mau makan apa?',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF697386),
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0754D9),
            Color(0xFF0A5BE5),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0754D9).withOpacity(.20),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'SALDO KANTINPAY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Rp48.500',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      Icons.bolt_rounded,
                      color: Colors.white70,
                      size: 12,
                    ),
                    SizedBox(width: 3),
                    Text(
                      'Siap buat makan siang kilat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: Color(0xFF0754D9),
                  size: 17,
                ),
                SizedBox(width: 5),
                Text(
                  'Top Up',
                  style: TextStyle(
                    color: Color(0xFF0754D9),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: const Color(0xFFE8E8F0),
              ),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Cari nasi goreng, ayam geprek, es kopi',
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8B93A5),
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  size: 21,
                  color: Color(0xFF6B7280),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 13),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFE8ECFF),
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(
            Icons.tune_rounded,
            color: Color(0xFF253D80),
            size: 21,
          ),
        ),
      ],
    );
  }

  Widget _buildTips() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFDDE5FF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF2864E8),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.access_time_rounded,
              color: Colors.white,
              size: 21,
            ),
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Pesan sebelum kelas usai!',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF172033),
                      ),
                    ),
                    SizedBox(width: 5),
                    _TipBadge(),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  'Hindari antrean padat jam 12.00. Ambil pesanan tanpa desak-desakan.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF5F687A),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      'Semua',
      'Aneka Nasi',
      'Mie & Bakso',
      'Minuman',
    ];

    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = index == 0;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected
                  ? const Color(0xFF0754D9)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: selected
                  ? null
                  : Border.all(
                      color: const Color(0xFFE7E7EE),
                    ),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: selected
                    ? Colors.white
                    : const Color(0xFF4F5666),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDensitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: Color(0xFF0754D9),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 7),
            const Text(
              'Kepadatan Kantin Kampus',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF172033),
              ),
            ),
            const Spacer(),
            Text(
              '@ Live Update',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _DensityCard(
          name: 'Kantin Pusat GKU',
          subtitle: '14 Stand Buka • Gedung Kuliah Umum Lt. 1',
          percentage: 88,
          estimate: '~25 mnt',
          queue: '18 antrean aktif',
          status: 'Ramai',
          statusColor: const Color(0xFFFFD6D2),
          statusTextColor: const Color(0xFFC83232),
          progressColor: const Color(0xFFC83232),
        ),
        const SizedBox(height: 9),
        _DensityCard(
          name: 'Pujasera Teknik',
          subtitle: '9 Stand Buka • Sayap Barat Dekat FT',
          percentage: 52,
          estimate: '~12 mnt',
          queue: '7 antrean aktif',
          status: 'Sedang',
          statusColor: const Color(0xFFFFE0B2),
          statusTextColor: const Color(0xFF754800),
          progressColor: const Color(0xFFA36A00),
        ),
        const SizedBox(height: 9),
        _DensityCard(
          name: 'Kantin Rumpun Kesehatan',
          subtitle: '6 Stand Buka • Area RIK Gedung C',
          percentage: 20,
          estimate: '~5 mnt',
          queue: '2 antrean aktif',
          status: 'Sepi',
          statusColor: const Color(0xFFB8F5D9),
          statusTextColor: const Color(0xFF08724E),
          progressColor: const Color(0xFF08724E),
        ),
      ],
    );
  }

  Widget _buildPopularSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu Terlaris Kampus 🔥',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF172033),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Paling digemari mahasiswa saat istirahat',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF697386),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Lihat Semua ›',
                style: TextStyle(
                  color: Color(0xFF0754D9),
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ..._menus.map(
          (menu) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _PopularMenuCard(
              menu: menu,
              onTap: () {
                context.push(
                  '/detail',
                  extra: menu,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEcoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF6FE7B7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF087A55),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.eco_outlined,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 11),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bawa Tumbler & Tepak Makan?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF086B4C),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Dapatkan potongan langsung Diskon Rp1.000 per menu di seluruh stand mitra kampus hijau.',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF247258),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.savings_outlined,
            color: Color(0xFF087A55),
            size: 22,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 72,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE8E8EF),
          ),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomItem(
            icon: Icons.storefront_rounded,
            label: 'Beranda',
            active: true,
          ),
          _BottomItem(
            icon: Icons.receipt_long_outlined,
            label: 'Pesanan',
          ),
          _BottomItem(
            icon: Icons.confirmation_num_outlined,
            label: 'Antrean',
          ),
          _BottomItem(
            icon: Icons.account_circle_outlined,
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class _TipBadge extends StatelessWidget {
  const _TipBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0754D9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Text(
        'Tips',
        style: TextStyle(
          color: Colors.white,
          fontSize: 8,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _DensityCard extends StatelessWidget {
  const _DensityCard({
    required this.name,
    required this.subtitle,
    required this.percentage,
    required this.estimate,
    required this.queue,
    required this.status,
    required this.statusColor,
    required this.statusTextColor,
    required this.progressColor,
  });

  final String name;
  final String subtitle;
  final int percentage;
  final String estimate;
  final String queue;
  final String status;
  final Color statusColor;
  final Color statusTextColor;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.035),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF172033),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: statusTextColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        color: statusTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF697386),
            ),
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              Text(
                'Kepadatan $percentage%',
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4D5565),
                ),
              ),
              const Spacer(),
              Text(
                'Est. $estimate • $queue',
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4D5565),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 6,
              backgroundColor: const Color(0xFFE5E9F7),
              valueColor: AlwaysStoppedAnimation<Color>(
                progressColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopularMenuCard extends StatelessWidget {
  const _PopularMenuCard({
    required this.menu,
    required this.onTap,
  });

  final Menu menu;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 9,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 96,
                height: 96,
                child: Image.network(
                  menu.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      color: const Color(0xFFEAF0FF),
                      child: const Icon(
                        Icons.restaurant_rounded,
                        color: Color(0xFF2864E8),
                        size: 32,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A4A4A),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFD15C),
                          size: 10,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '4.8',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Nama menu
                  Text(
                    menu.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF172033),
                    ),
                  ),

                  const SizedBox(height: 3),

                  // Nama kantin
                  const Text(
                    '▣ Warung Barokah Bu Siti • Kantin Pusat',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFF697386),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Deskripsi
                  Text(
                    menu.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xFF697386),
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 7),

                  // Harga + tombol
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Rp ${menu.price.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF172033),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0754D9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Pesan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class _BottomItem extends StatelessWidget {
  const _BottomItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 21,
          color: active
              ? const Color(0xFF0754D9)
              : const Color(0xFF697386),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: active
                ? const Color(0xFF0754D9)
                : const Color(0xFF697386),
          ),
        ),
      ],
    );
  }
}