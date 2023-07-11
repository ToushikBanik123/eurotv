class User {
  final String number;
  final String tokenId;

  User({required this.number, required this.tokenId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      number: json['number'],
      tokenId: json['token_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'token_id': tokenId,
    };
  }
}
