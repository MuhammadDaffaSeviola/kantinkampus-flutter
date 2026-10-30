class QueueTicket {
  final String id;
  final String orderId;
  final String ticketNumber;
  final String status;

  const QueueTicket({
    required this.id,
    required this.orderId,
    required this.ticketNumber,
    required this.status,
  });
}
