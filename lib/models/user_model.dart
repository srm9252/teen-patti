class UserModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final double wallet;
  final bool isTrialActive;
  final DateTime trialEnd;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.wallet,
    required this.isTrialActive,
    required this.trialEnd,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      wallet: json['wallet']?.toDouble() ?? 0.0,
      isTrialActive: json['isTrialActive'],
      trialEnd: DateTime.parse(json['trialEnd']),
    );
  }
}