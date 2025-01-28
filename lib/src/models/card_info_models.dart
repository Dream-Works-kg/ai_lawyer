class CardModel {
  final String cardNumber;
  final String cardHolderName;
  final String expiryMonth;
  final String expiryYear;
  final String cvc;
  final bool isDefault;
  final String cardLogo; // Добавлено поле cardLogo

  CardModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvc,
    this.isDefault = false,
    required this.cardLogo,
  });

  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryMonth': expiryMonth,
      'expiryYear': expiryYear,
      'cvc': cvc,
      'isDefault': isDefault,
      'cardLogo': cardLogo, // Сохраняем логотип карты
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardNumber: map['cardNumber'] ?? '',
      cardHolderName: map['cardHolderName'] ?? '',
      expiryMonth: map['expiryMonth'] ?? '',
      expiryYear: map['expiryYear'] ?? '',
      cvc: map['cvc'] ?? '',
      isDefault: map['isDefault'] ?? false,
      cardLogo:
          map['cardLogo'] ?? 'assets/images/peymont.png', // Дефолтный логотип
    );
  }
}
