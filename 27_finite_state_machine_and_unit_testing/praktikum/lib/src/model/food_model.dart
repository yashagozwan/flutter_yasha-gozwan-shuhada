class Food {
  int id;
  String name;
  int quantity;

  Food({
    required this.id,
    required this.name,
    this.quantity = 0,
  });

  factory Food.fromMap(Map<String, dynamic> data) {
    return Food(
      id: data['id'],
      name: data['name'],
    );
  }

  @override
  String toString() {
    return 'Food(id:$id, name:$name)';
  }
}
