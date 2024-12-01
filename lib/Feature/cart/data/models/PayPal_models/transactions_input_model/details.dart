class Details {
  String? subtotal;
  String? tax;
  String? shipping;
  String? handlingFee;
  String? shippingDiscount;
  String? insurance;

  Details({
    this.subtotal,
    this.tax,
    this.shipping,
    this.handlingFee,
    this.shippingDiscount,
    this.insurance,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        subtotal: json['subtotal'] as String?,
        tax: json['tax'] as String?,
        shipping: json['shipping'] as String?,
        handlingFee: json['handling_fee'] as String?,
        shippingDiscount: json['shipping_discount'] as String?,
        insurance: json['insurance'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'tax': tax,
        'shipping': shipping,
        'handling_fee': handlingFee,
        'shipping_discount': shippingDiscount,
        'insurance': insurance,
      };
}
