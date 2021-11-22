class BookModel {
  List<String>? bookDetails;
  String? sId;
  String? imageSrc;
  String? bookName;
  String? authorName;
  String? publisherName;
  String? shortInfo;
  String? orginalPrice;
  String? discountPrice;
  String? discountAmount;

  BookModel(
      {required this.bookDetails,
      required this.sId,
      required this.imageSrc,
      required this.bookName,
      required this.authorName,
      required this.publisherName,
      required this.shortInfo,
      required this.orginalPrice,
      required this.discountPrice,
      required this.discountAmount});

  BookModel.fromJson(Map<String, dynamic> json) {
    bookDetails = json['book_details'].cast<String>();
    sId = json['_id'];
    imageSrc = json['image_src'];
    bookName = json['book_name'];
    authorName = json['author_name'];
    publisherName = json['publisher_name'];
    shortInfo = json['short_info'];
    orginalPrice = json['orginal_price'];
    discountPrice = json['discount_price'];
    discountAmount = json['discount_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_details'] = this.bookDetails;
    data['_id'] = this.sId;
    data['image_src'] = this.imageSrc;
    data['book_name'] = this.bookName;
    data['author_name'] = this.authorName;
    data['publisher_name'] = this.publisherName;
    data['short_info'] = this.shortInfo;
    data['orginal_price'] = this.orginalPrice;
    data['discount_price'] = this.discountPrice;
    data['discount_amount'] = this.discountAmount;
    return data;
  }
}
