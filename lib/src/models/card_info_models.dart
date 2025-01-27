class CardInfo {
  final String cardNumber;
  final String cardHolderName;
  final String expiryMonth;
  final String expiryYear;
  final String cvc;
  final bool isDefault;

  CardInfo({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvc,
    required this.isDefault,
  });

  Map<String, dynamic> toJson() => {
        'cardNumber': cardNumber,
        'cardHolderName': cardHolderName,
        'expiryMonth': expiryMonth,
        'expiryYear': expiryYear,
        'cvc': cvc,
        'isDefault': isDefault,
      };

  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(
      cardNumber: json['cardNumber'],
      cardHolderName: json['cardHolderName'],
      expiryMonth: json['expiryMonth'],
      expiryYear: json['expiryYear'],
      cvc: json['cvc'],
      isDefault: json['isDefault'],
    );
  }
}
