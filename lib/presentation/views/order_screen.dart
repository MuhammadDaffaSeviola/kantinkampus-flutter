import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan Saya'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Pesanan Aktif',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          _OrderCard(
            orderNumber: '#ORD-001',
            date: '31 Oktober 2026, 12:30',
            items: 'Nasi Ayam Geprek × 1',
            total: 'Rp 15.000',
            status: 'Diproses',
            statusColor: theme.colorScheme.primary,
          ),
          const SizedBox(height: 12),
          _OrderCard(
            orderNumber: '#ORD-002',
            date: '31 Oktober 2026, 10:15',
            items: 'Mie Aceh × 1, Es Teh × 1',
            total: 'Rp 18.000',
            status: 'Siap Diambil',
            statusColor: Colors.green,
          ),
          const SizedBox(height: 24),
          Text(
            'Riwayat Pesanan',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          _OrderCard(
            orderNumber: '#ORD-000',
            date: '30 Oktober 2026, 13:20',
            items: 'Nasi Goreng × 1',
            total: 'Rp 14.000',
            status: 'Selesai',
            statusColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    required this.orderNumber,
    required this.date,
    required this.items,
    required this.total,
    required this.status,
    required this.statusColor,
  });

  final String orderNumber;
  final String date;
  final String items;
  final String total;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    orderNumber,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            Text(items),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Total',
                  style: theme.textTheme.bodyMedium,
                ),
                const Spacer(),
                Text(
                  total,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
