enum DeliveryMethod { delivery, pickup }

class Product {
  final String id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() => '$name (${price.toStringAsFixed(2)})';
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({required this.product, required this.quantity}) {
    if (quantity <= 0) {
      throw ArgumentError.value(quantity, 'quantity', 'Must be > 0');
    }
  }

  double get itemTotal => product.price * quantity;

  @override
  String toString() =>
      '${product.name} x$quantity => ${itemTotal.toStringAsFixed(2)}';
}

class Address {
  final String street;
  final String city;
  final String zip;

  Address({required this.street, required this.city, required this.zip});

  @override
  String toString() => '$street, $city $zip';
}

class Order {
  final String id;
  final List items;
  final DeliveryMethod deliveryMethod;
  final Address? deliveryAddress;
  final double deliveryFee;

  Order({
    required this.id,
    required this.items,
    required this.deliveryMethod,
    this.deliveryAddress,
    this.deliveryFee = 0.0,
  }) {
    if (deliveryMethod == DeliveryMethod.delivery && deliveryAddress == null) {
      throw ArgumentError('Delivery orders must have an address.');
    }
  }

  double get totalAmount =>
      items.fold(0.0, (sum, item) => sum + item.itemTotal) + deliveryFee;

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.writeln('Order $id (${deliveryMethod.name})');
    for (var item in items) {
      buffer.writeln(' $item');
    }
    if (deliveryMethod == DeliveryMethod.delivery) {
      buffer.writeln(' Address: ${deliveryAddress!}');
      buffer.writeln(' Delivery Fee: ${deliveryFee.toStringAsFixed(2)}');
    }
    buffer.writeln(' TOTAL: ${totalAmount.toStringAsFixed(2)}');
    return buffer.toString();
  }
}
