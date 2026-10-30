import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../data/models/menu.dart';

class MenuDetailView extends StatefulWidget {
  const MenuDetailView({
    super.key,
    required this.menu,
  });

  final Menu menu;

  @override
  State<MenuDetailView> createState() => _MenuDetailViewState();
}

class _MenuDetailViewState extends State<MenuDetailView> {
  int quantity = 1;
  int selectedSpice = 0;
  int selectedEgg = 0;

  final TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menu = widget.menu;
    final total = menu.price * quantity;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFF8F7FF),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 430,
          ),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Scaffold(
              backgroundColor: const Color(0xFFF8F7FF),

        appBar: AppBar(
        backgroundColor: const Color(0xFFF8F7FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Detail',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {},
            
          ),
        ],
        
      ),
      

      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =========================
                // HEADER DETAIL
                // =========================
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9EDFF),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                          ),
                          onPressed: () =>
                              Navigator.of(context).pop(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Detail Menu',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      _CircleIconButton(
                        icon: Icons.bookmark_border,
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      _CircleIconButton(
                        icon: Icons.share_outlined,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                // =========================
                // IMAGE
                // =========================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.35,
                          child: menu.imageUrl.isNotEmpty
                              ? Image.network(
                                  menu.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (_, __, ___) {
                                    return _imagePlaceholder();
                                  },
                                )
                              : _imagePlaceholder(),
                        ),

                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF00A66A),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Tersedia',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 12,
                          left: 12,
                          child: _imageBadge(
                            Icons.star,
                            '4.8  (142 ulasan)',
                          ),
                        ),

                        Positioned(
                          bottom: 12,
                          right: 12,
                          child: _imageBadge(
                            Icons.access_time,
                            'Est. 12–15 mnt',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // =========================
                // INFORMASI MENU
                // =========================
                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '▣ Warung Barokah • Kantin Pusat GKU',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF5D6170),
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        menu.name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF172033),
                        ),
                      ),

                      const SizedBox(height: 5),

                      Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Rp ${menu.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0758D9),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Padding(
                            padding:
                                EdgeInsets.only(bottom: 4),
                            child: Text(
                              '/ porsi piring saji',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF656A78),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // INFO KANTIN
                      // =========================
                      _InfoCard(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFE4EAFF,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.apartment,
                                    color: Color(0xFF1761D8),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kantin Pusat GKU',
                                        style: TextStyle(
                                          fontWeight:
                                              FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        'Lt. 1 Gedung Kuliah Bersama',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color:
                                              Color(0xFF666B78),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFD9D6),
                                    borderRadius:
                                        BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    '● Ramai (18 antrean aktif)',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight:
                                          FontWeight.w700,
                                      color: Color(0xFFD93636),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F8FF),
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: Color(0xFF1260DC),
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Est. waktu saji ~25 menit. Kantin siap memproses pesanan lebih awal sebelum jam istirahat.',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color:
                                            Color(0xFF535866),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // DESKRIPSI
                      // =========================
                      _InfoCard(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Deskripsi Menu',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              menu.description.isNotEmpty
                                  ? menu.description
                                  : 'Nasi goreng racikan bumbu khas Nusantara dengan suwiran ayam, telur mata sapi setengah matang, irisan bakso, acar timun segar, dan kerupuk renyah.',
                              style: const TextStyle(
                                fontSize: 13,
                                height: 1.5,
                                color: Color(0xFF5C6170),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // TINGKAT KEPEDASAN
                      // =========================
                      _SectionCard(
                        title: 'Tingkat Kepedasan',
                        subtitle: 'Pilih satu preferensi rasa',
                        requiredText: 'Wajib',
                        child: Row(
                          children: [
                            Expanded(
                              child: _ChoiceButton(
                                icon: Icons.sentiment_satisfied,
                                label: 'Tidak Pedas',
                                selected:
                                    selectedSpice == 0,
                                onTap: () {
                                  setState(() {
                                    selectedSpice = 0;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _ChoiceButton(
                                icon: Icons.local_fire_department,
                                label: 'Sedang',
                                selected:
                                    selectedSpice == 1,
                                onTap: () {
                                  setState(() {
                                    selectedSpice = 1;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _ChoiceButton(
                                icon: Icons.whatshot,
                                label: 'Pedas\nMantap',
                                selected:
                                    selectedSpice == 2,
                                onTap: () {
                                  setState(() {
                                    selectedSpice = 2;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // PILIHAN TELUR
                      // =========================
                      _SectionCard(
                        title: 'Pilihan Telur',
                        subtitle:
                            'Pilih penyajian telur favoritmu',
                        requiredText: 'Wajib',
                        child: Column(
                          children: [
                            _RadioChoice(
                              label: 'Telur Mata Sapi Matang',
                              selected: selectedEgg == 0,
                              onTap: () {
                                setState(() {
                                  selectedEgg = 0;
                                });
                              },
                            ),
                            const SizedBox(height: 6),
                            _RadioChoice(
                              label:
                                  'Setengah Matang (Lumer)',
                              selected: selectedEgg == 1,
                              onTap: () {
                                setState(() {
                                  selectedEgg = 1;
                                });
                              },
                            ),
                            const SizedBox(height: 6),
                            _RadioChoice(
                              label: 'Telor Dadar Gurih',
                              selected: selectedEgg == 2,
                              onTap: () {
                                setState(() {
                                  selectedEgg = 2;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // CATATAN
                      // =========================
                      _SectionCard(
                        title:
                            'Catatan Khusus untuk Penjual',
                        subtitle:
                            'Bantu penjual menyesuaikan pesanan sesuai selera Anda',
                        requiredText: 'Opsional',
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.end,
                          children: [
                            TextField(
                              controller: noteController,
                              maxLines: 3,
                              maxLength: 120,
                              decoration: InputDecoration(
                                hintText:
                                    'cth. Tidak pedas, bawang goreng dipisah, kerupuk dibanyakin...',
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF858A98),
                                ),
                                filled: true,
                                fillColor:
                                    const Color(0xFFF0F2FF),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // =========================
                      // JUMLAH PESANAN
                      // =========================
                      _InfoCard(
                        child: Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jumlah Pesanan',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                          FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Subtotal akan mengikuti jumlah',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          Color(0xFF666B78),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFFE9EDFF),
                                borderRadius:
                                    BorderRadius.circular(22),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    visualDensity:
                                        VisualDensity.compact,
                                    onPressed: quantity > 1
                                        ? () {
                                            setState(() {
                                              quantity--;
                                            });
                                          }
                                        : null,
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    '$quantity',
                                    style: const TextStyle(
                                      fontWeight:
                                          FontWeight.w700,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Container(
                                    width: 34,
                                    height: 34,
                                    decoration:
                                        const BoxDecoration(
                                      color: Color(0xFF0758D9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // BOTTOM ACTION
          // =========================
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                16,
                12,
                16,
                16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    blurRadius: 12,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Bayar',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF666B78),
                            ),
                          ),
                          Text(
                            'Rp ${total.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0758D9),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 245,
                      height: 50,
                      child: ElevatedButton.icon(
                       onPressed: menu.isAvailable
    ? () {
        context.push('/order');
      }
    : null,
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 19,
                        ),
                        label: const Text(
                          'Tambah ke Pesanan',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF0758D9),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      color: const Color(0xFFE8EEFF),
      child: const Center(
        child: Icon(
          Icons.restaurant,
          size: 70,
          color: Color(0xFF2864E8),
        ),
      ),
    );
  }

  Widget _imageBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.55),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 12,
            color: Colors.white,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// CIRCLE BUTTON
// =====================================================

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: Color(0xFFE9EDFF),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 19,
          color: Color(0xFF333847),
        ),
      ),
    );
  }
}

// =====================================================
// INFO CARD
// =====================================================

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

// =====================================================
// SECTION CARD
// =====================================================

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.requiredText,
    required this.child,
  });

  final String title;
  final String subtitle;
  final String requiredText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EDFF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  requiredText,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF535A73),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF6B7080),
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

// =====================================================
// SPICE CHOICE
// =====================================================

class _ChoiceButton extends StatelessWidget {
  const _ChoiceButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(9),
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF0758D9)
              : const Color(0xFFE9EDFF),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 17,
              color: selected
                  ? Colors.white
                  : const Color(0xFF3D4353),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: selected
                    ? Colors.white
                    : const Color(0xFF273044),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// RADIO CHOICE
// =====================================================

class _RadioChoice extends StatelessWidget {
  const _RadioChoice({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(9),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFDCE4FF)
              : const Color(0xFFF0F2FF),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              size: 20,
              color: selected
                  ? const Color(0xFF0758D9)
                  : const Color(0xFF8A8F9E),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF303646),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}