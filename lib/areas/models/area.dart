class Area {
  final int id;
  final String name;
  final String code;

  Area({required this.id, required this.name, required this.code});
  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(id: json['id'], name: json['name'], code: json['code']);
  }
  @override
  String toString() {
    return super.toString();
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Area && other.name == name && other.code == code;
  }

  @override
  int get hashCode => Object.hash(name, code);
}
