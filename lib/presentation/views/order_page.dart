import 'package:flutter/material.dart';
import 'order_success_view.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  int quantity = 1;
  int selectedPayment = 0;

  final int price = 15000;

  int get total => price * quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FF),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: Stack(
            children: [
              Column(
                children: [
                  // =====================================================
                  // HEADER
                  // =====================================================
                  Container(
                    height: 72,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8F7FF),
                    ),
                    child: Row(
                      children: [
                        _CircleButton(
                          icon: Icons.arrow_back,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Konfirmasi',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF182033),
                              ),
                            ),
                          ),
                        ),
                        _CircleButton(
                          icon: Icons.help_outline,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),

                  // =====================================================
                  // CONTENT
                  // =====================================================
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        8,
                        16,
                        125,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // =================================================
                          // LOKASI PENGAMBILAN
                          // =================================================
                          _SectionCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'LOKASI PENGAMBILAN',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF0758D9),
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 9,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFCFF7E7),
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        '● Buka • Antrean Lancar',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF008B5A),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 14),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE7EDFF),
                                        borderRadius:
                                            BorderRadius.circular(11),
                                      ),
                                      child: const Icon(
                                        Icons.storefront,
                                        color: Color(0xFF0758D9),
                                        size: 21,
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
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF182033),
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            'Loket 2 - Warung Barokah Bu Siti '
                                            '(Gedung Kuliah Bersama Lt. 1)',
                                            style: TextStyle(
                                              fontSize: 11,
                                              height: 1.3,
                                              color: Color(0xFF666D7C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 12),

                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 9,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE9EDFF),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 17,
                                        color: Color(0xFF0758D9),
                                      ),
                                      SizedBox(width: 7),
                                      Expanded(
                                        child: Text(
                                          'Estimasi siap: ~10-15 menit setelah konfirmasi',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF535866),
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

                          // =================================================
                          // RINCIAN MENU
                          // =================================================
                          _SectionCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Rincian Menu',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF182033),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '$quantity Item',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF535866),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 14),

                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE9EDFF),
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(7),
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=300&q=80',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (_, __, ___) {
                                            return Container(
                                              width: 80,
                                              height: 80,
                                              color: const Color(0xFFDDE3F7),
                                              child: const Icon(
                                                Icons.restaurant,
                                                color: Color(0xFF0758D9),
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      const SizedBox(width: 9),

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Nasi Goreng Special',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF182033),
                                              ),
                                            ),
                                            const SizedBox(height: 3),
                                            Text(
                                              'Rp ${_formatRupiah(price)}',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF0758D9),
                                              ),
                                            ),

                                            const SizedBox(height: 8),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                _QuantityButton(
                                                  icon: Icons.remove,
                                                  onTap: quantity > 1
                                                      ? () {
                                                          setState(() {
                                                            quantity--;
                                                          });
                                                        }
                                                      : null,
                                                ),
                                                SizedBox(
                                                  width: 32,
                                                  child: Center(
                                                    child: Text(
                                                      '$quantity',
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                _QuantityButton(
                                                  icon: Icons.add,
                                                  filled: true,
                                                  onTap: () {
                                                    setState(() {
                                                      quantity++;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE2E8FF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.format_list_bulleted,
                                        size: 15,
                                        color: Color(0xFF535866),
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        'Tidak pedas',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF535866),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 16),

                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      size: 17,
                                    ),
                                    label: const Text(
                                      'Tambah Menu Lain',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          const Color(0xFFE4E9FF),
                                      foregroundColor:
                                          const Color(0xFF0758D9),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // =================================================
                          // METODE PEMBAYARAN
                          // =================================================
                          _SectionCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Metode Pembayaran',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF182033),
                                  ),
                                ),

                                const SizedBox(height: 14),

                                _PaymentOption(
                                  index: 0,
                                  selected: selectedPayment == 0,
                                  icon: Icons.qr_code_2,
                                  title: 'QRIS Instant',
                                  subtitle:
                                      'GoPay, OVO, Dana, ShopeePay, BCA',
                                  badge: 'Rekomendasi',
                                  onTap: () {
                                    setState(() {
                                      selectedPayment = 0;
                                    });
                                  },
                                ),

                                const SizedBox(height: 8),

                                _PaymentOption(
                                  index: 1,
                                  selected: selectedPayment == 1,
                                  icon: Icons.account_balance_wallet,
                                  title: 'Saldo KantinPay',
                                  subtitle: 'Saldo: Rp 48.500 (Cukup)',
                                  onTap: () {
                                    setState(() {
                                      selectedPayment = 1;
                                    });
                                  },
                                ),

                                const SizedBox(height: 8),

                                _PaymentOption(
                                  index: 2,
                                  selected: selectedPayment == 2,
                                  icon: Icons.payments_outlined,
                                  title: 'Tunai di Loket',
                                  subtitle:
                                      'Bayar langsung saat giliran dipanggil',
                                  onTap: () {
                                    setState(() {
                                      selectedPayment = 2;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // =================================================
                          // RINGKASAN PEMBAYARAN
                          // =================================================
                          _SectionCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ringkasan Pembayaran',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF182033),
                                  ),
                                ),

                                const SizedBox(height: 14),

                                _SummaryRow(
                                  label: 'Subtotal Makanan ($quantity×)',
                                  value: 'Rp ${_formatRupiah(total)}',
                                ),

                                const SizedBox(height: 9),

                                const _SummaryRow(
                                  label: 'Biaya Layanan',
                                  value: 'Gratis (Kampus)',
                                  valueColor: Color(0xFF008B5A),
                                ),

                                const SizedBox(height: 9),

                                const _SummaryRow(
                                  label: 'Diskon Wadah Sendiri',
                                  value: '-Rp 0',
                                ),

                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 12),
                                  child: Divider(
                                    height: 1,
                                    color: Color(0xFFE8EAF0),
                                  ),
                                ),

                                Row(
                                  children: [
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'TOTAL TAGIHAN',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF535866),
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            'Sudah termasuk pajak',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF008B5A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Rp ${_formatRupiah(total)}',
                                      style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF0758D9),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // =================================================
                          // ANTREAN OTOMATIS
                          // =================================================
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE3E9FF),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF2165D8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.lightbulb_outline,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),

                                const SizedBox(width: 11),

                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Antrean Otomatis Siap!',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF0758D9),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Nomor tiket antrean otomatis diterbitkan '
                                        'setelah konfirmasi pesanan. Kamu bisa '
                                        'santai di kelas sampai ada notifikasi siap ambil!',
                                        style: TextStyle(
                                          fontSize: 11,
                                          height: 1.45,
                                          color: Color(0xFF535866),
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
                  ),
                ],
              ),

              // ===========================================================
              // BOTTOM ACTION
              // ===========================================================
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
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 15,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'TOTAL AKHIR',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF535866),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Rp ${_formatRupiah(total)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0758D9),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          height: 52,
                          child: ElevatedButton(
                           onPressed: () {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const OrderSuccessView(),
    ),
  );
},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xFF2165D8),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pesan Sekarang',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 19,
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
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// SECTION CARD
// =====================================================

class _SectionCard extends StatelessWidget {
  const _SectionCard({
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
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}

// =====================================================
// PAYMENT OPTION
// =====================================================

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.index,
    required this.selected,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.badge,
  });

  final int index;
  final bool selected;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(9),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFE0E7FF)
              : const Color(0xFFF0F2FF),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: selected
                    ? const Color(0xFF0758D9)
                    : const Color(0xFF535866),
                size: 21,
              ),
            ),

            const SizedBox(width: 9),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF182033),
                        ),
                      ),
                      if (badge != null) ...[
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0758D9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            badge!,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 10,
                      color: index == 1
                          ? const Color(0xFF008B5A)
                          : const Color(0xFF666D7C),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF0758D9)
                    : const Color(0xFFD7DEFA),
                shape: BoxShape.circle,
              ),
              child: selected
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 14,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// SUMMARY ROW
// =====================================================

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.valueColor = const Color(0xFF303646),
  });

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF535866),
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

// =====================================================
// QUANTITY BUTTON
// =====================================================

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    required this.icon,
    required this.onTap,
    this.filled = false,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: filled
          ? const Color(0xFF0758D9)
          : Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: filled
                  ? const Color(0xFF0758D9)
                  : const Color(0xFFD4DBF2),
            ),
          ),
          child: Icon(
            icon,
            size: 17,
            color: filled
                ? Colors.white
                : const Color(0xFF6C7383),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// CIRCLE BUTTON
// =====================================================

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFE9EDFF),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 42,
          height: 42,
          child: Icon(
            icon,
            size: 20,
            color: const Color(0xFF303646),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// FORMAT RUPIAH
// =====================================================

String _formatRupiah(int value) {
  return value.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
      );
}