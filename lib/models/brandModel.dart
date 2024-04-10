class BrandModel {
  String internalId;
  String barcode;
  String name;
  String vendorCode;
  String price;
  String comment;
  String productLink;
  String itemLive;

  BrandModel({
    required this.internalId,
    required this.barcode,
    required this.name,
    required this.vendorCode,
    required this.price,
    required this.comment,
    required this.productLink,
    required this.itemLive,
  });

  factory BrandModel.fromJson(dynamic json) {
    return BrandModel(
      internalId: "${json['internalId']}",
      barcode: "${json['barcode']}",
      name: "${json['name']}",
      vendorCode: "${json['vendorCode']}",
      price: "${json['price']}",
      comment: "${json['comment']}",
      productLink: "${json['productLink']}",
      itemLive: "${json['itemLive']}",
    );
  }

  Map toJson() => {
        'internal_id': internalId,
        'barcode': barcode,
        'name': name,
        'vendorCode': vendorCode,
        'price': price,
        'comment': comment,
        'product_link': productLink,
        'item_live': itemLive,
      };
}
