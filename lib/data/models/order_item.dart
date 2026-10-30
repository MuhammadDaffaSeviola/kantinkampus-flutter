class OrderItem {
  final String id;
  final String orderId;
  final String menuId;
  final String menuName;
  final int quantity;
  final String price;

  const OrderItem({
    required this.id,
    required this.orderId,
    required this.menuId,
    required this.menuName,
    required this.quantity,
    required this.price,
  });
}
