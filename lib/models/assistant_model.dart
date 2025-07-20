class Assistant {
  final String id;
  final String userName;
  final String email;
  final String phoneNumber;
  final String role;

  Assistant({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) {
    return Assistant(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
    );
  }

  // دالة مساعدة لعرض معلومات مختصرة عن المساعد
  String get shortInfo => '$userName ($role)';
}