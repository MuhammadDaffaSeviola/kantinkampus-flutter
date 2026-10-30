class Order {
  final String id;
  final String userId;
  final String canteenId;
  final String status;
  final String totalPrice;

  const Order({
    required this.id,
    required this.userId,
    required this.canteenId,
    required this.status,
    required this.totalPrice,
  });
}
