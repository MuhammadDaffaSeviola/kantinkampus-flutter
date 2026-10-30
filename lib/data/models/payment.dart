class Payment {
  final String id;
  final String orderId;
  final String method;
  final String status;
  final String amount;

  const Payment({
    required this.id,
    required this.orderId,
    required this.method,
    required this.status,
    required this.amount,
  });
}
