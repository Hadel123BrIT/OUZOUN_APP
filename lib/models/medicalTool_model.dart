class MedicalTool {
  final int id;
  final String name;
  final double width;
  final double height;
  final double thickness;
  final int quantity;
  final int? kitId;
  final int categoryId;

  MedicalTool({
    required this.id,
    required this.name,
    required this.width,
    required this.height,
    required this.thickness,
    required this.quantity,
    this.kitId,
    required this.categoryId,
  });

  factory MedicalTool.fromJson(Map<String, dynamic> json) {
    return MedicalTool(
      id: json['id'],
      name: json['name'],
      width: json['width']?.toDouble() ?? 0.0,
      height: json['height']?.toDouble() ?? 0.0,
      thickness: json['thickness']?.toDouble() ?? 0.0,
      quantity: json['quantity'],
      kitId: json['kitId'],
      categoryId: json['categoryId'],
    );
  }

  String get dimensions => '${width}x${height}x${thickness} cm';
}