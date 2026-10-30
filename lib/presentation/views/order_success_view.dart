import 'package:flutter/material.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({super.key});

  static const Color bgColor = Color(0xFFF8F7FF);
  static const Color primaryBlue = Color(0xFF0758D9);
  static const Color lightBlue = Color(0xFFE8EDFF);
  static const Color textDark = Color(0xFF182238);
  static const Color textGrey = Color(0xFF687086);
  static const Color green = Color(0xFF00A86B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 430,
          ),
          child: SafeArea(
            child: Column(
              children: [
                // =========================================================
                // APP BAR
                // =========================================================
                Container(
                  height: 62,
                  color: bgColor,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            'Pesanan Berhasil',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: textDark,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                // =========================================================
                // CONTENT
                // =========================================================
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
                    child: Column(
                      children: [
                        // ===================================================
                        // SUCCESS ICON
                        // ===================================================
                        Container(
                          width: 78,
                          height: 78,
                          decoration: BoxDecoration(
                            color: const Color(0xFF75F0BD),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF75F0BD)
                                    .withValues(alpha: 0.35),
                                blurRadius: 22,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Container(
                              width: 46,
                              height: 46,
                              decoration: const BoxDecoration(
                                color: Color(0xFF07895D),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 29,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        const Text(
                          'Pesanan Berhasil!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: textDark,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          'Pesanan kamu telah diterima oleh Kantin Pusat GKU.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.4,
                            color: textGrey,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ORDER NUMBER
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.receipt_long_outlined,
                                size: 14,
                                color: textGrey,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Order #KP-9824',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: textDark,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  '•',
                                  style: TextStyle(
                                    color: textGrey,
                                  ),
                                ),
                              ),
                              Text(
                                '11:45 WIB',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: textGrey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ===================================================
                        // ANTRIAN CARD
                        // ===================================================
                        _QueueCard(),

                        const SizedBox(height: 16),

                        // ===================================================
                        // NOTIFICATION CARD
                        // ===================================================
                        _InfoNotificationCard(),

                        const SizedBox(height: 16),

                        // ===================================================
                        // ORDER ITEM
                        // ===================================================
                        _FoodCard(),

                        const SizedBox(height: 18),

                        // ===================================================
                        // STATUS BUTTON
                        // ===================================================
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryBlue,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            icon: const Icon(
                              Icons.confirmation_number_outlined,
                              size: 20,
                            ),
                            label: const Text(
                              'Lihat Status Antrean',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ===================================================
                        // HOME BUTTON
                        // ===================================================
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).popUntil(
                                (route) => route.isFirst,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lightBlue,
                              foregroundColor: textDark,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            icon: const Icon(
                              Icons.home_outlined,
                              size: 20,
                            ),
                            label: const Text(
                              'Kembali ke Home',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
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
      ),
    );
  }
}

// ===========================================================================
// QUEUE CARD
// ===========================================================================

class _QueueCard extends StatelessWidget {
  const _QueueCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EDFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // HEADER
          Row(
            children: [
              const Text(
                'NOMOR ANTREAN ANDA',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0758D9),
                  letterSpacing: 0.4,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFD7E2FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 7,
                      color: Color(0xFF0758D9),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Sedang Diproses',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0758D9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 7),

          // BIG QUEUE NUMBER
          const Text(
            '# B-043',
            style: TextStyle(
              fontSize: 44,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              color: Color(0xFF0758D9),
            ),
          ),

          const SizedBox(height: 8),

          // ESTIMASI + LOKET
          Row(
            children: [
              Expanded(
                child: _SmallQueueInfo(
                  icon: Icons.access_time,
                  title: 'Estimasi Tunggu',
                  value: '±10 Menit',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _SmallQueueInfo(
                  icon: Icons.storefront_outlined,
                  title: 'Lokasi Loket',
                  value: 'Loket A • GKU',
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // SERVED BY
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFD7E2FF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.groups_outlined,
                  size: 16,
                  color: Color(0xFF0758D9),
                ),
                const SizedBox(width: 5),
                const Text(
                  'Dilayani: ',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF303646),
                  ),
                ),
                const Text(
                  '#B-041',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0758D9),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '2 Orang di Depan',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4D5568),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 13),

          // STAGE TITLE
          const Row(
            children: [
              Text(
                'Tahap 2 dari 4',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0758D9),
                ),
              ),
              Spacer(),
              Text(
                'Memasak Menu',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4D5568),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // PROGRESS
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.5,
              minHeight: 7,
              backgroundColor: const Color(0xFFD4DCFA),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF0758D9),
              ),
            ),
          ),

          const SizedBox(height: 7),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Diterima',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0758D9),
                ),
              ),
              Text(
                'Dimasak',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0758D9),
                ),
              ),
              Text(
                'Siap Ambil',
                style: TextStyle(
                  fontSize: 9,
                  color: Color(0xFF737A8C),
                ),
              ),
              Text(
                'Selesai',
                style: TextStyle(
                  fontSize: 9,
                  color: Color(0xFF737A8C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ===========================================================================
// SMALL QUEUE INFO
// ===========================================================================

class _SmallQueueInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _SmallQueueInfo({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EDFF),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Icon(
              icon,
              size: 16,
              color: const Color(0xFF0758D9),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 8,
                    color: Color(0xFF687086),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF20283A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ===========================================================================
// NOTIFICATION CARD
// ===========================================================================

class _InfoNotificationCard extends StatelessWidget {
  const _InfoNotificationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EDFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Color(0xFF2470E8),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tetap Santai di Kelas atau Selasar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF20283A),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Ponsel kamu akan bergetar dan membunyikan alarm lembut saat makanan siap diambil di loket kantin.',
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.45,
                    color: Color(0xFF687086),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ===========================================================================
// FOOD CARD
// ===========================================================================

class _FoodCard extends StatelessWidget {
  const _FoodCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // FOOD IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Container(
              width: 66,
              height: 66,
              color: const Color(0xFFE8EDFF),
              child: Image.network(
                'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=300&q=80',
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return const Icon(
                    Icons.restaurant,
                    color: Color(0xFF0758D9),
                    size: 30,
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 9),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EDFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Ayam Geprek Bu Joko',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0758D9),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Paket Geprek Sambal Bawang + Es Teh',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF20283A),
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  '1x Porsi Normal • Ekstra Sambal',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF687086),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ===========================================================================
// CIRCLE BUTTON
// ===========================================================================

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFE8EDFF),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            icon,
            size: 20,
            color: const Color(0xFF20283A),
          ),
        ),
      ),
    );
  }
}