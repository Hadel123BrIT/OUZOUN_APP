class Doctor {
  final String id;
  final String userName;
  final String email;
  final String phoneNumber;
  final String role;

  Doctor({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
    );
  }
}