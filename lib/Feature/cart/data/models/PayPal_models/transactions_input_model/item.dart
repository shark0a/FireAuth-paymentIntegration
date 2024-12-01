class Item {
  String? name;
  String? description;
  String? quantity;
  String? price;
  String? tax;
  String? sku;
  String? currency;

  Item({
    this.name,
    this.description,
    this.quantity,
    this.price,
    this.tax,
    this.sku,
    this.currency,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json['name'] as String?,
        description: json['description'] as String?,
        quantity: json['quantity'] as String?,
        price: json['price'] as String?,
        tax: json['tax'] as String?,
        sku: json['sku'] as String?,
        currency: json['currency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'quantity': quantity,
        'price': price,
        'tax': tax,
        'sku': sku,
        'currency': currency,
      };
}
