class Procedure{
  final bool  hasAssistant;
  final DateTime date;
  final int categoryId;
  final List<int> toolsId;
  final List<int> kitsId;

  Procedure({
   required this.hasAssistant,
   required this.date,
   required this.categoryId,
   required this.toolsId,
   required this.kitsId,
});
  Map<String, dynamic> toJson() => {
    'hasAssistant': hasAssistant,
    'date': date.toIso8601String(),
    'categoryId': categoryId,
    'toolsIds': toolsId,
    'kitIds': kitsId,
  };
}