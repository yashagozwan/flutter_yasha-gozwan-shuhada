import 'package:intl/intl.dart';

class UserCreate {
  String? id;
  String name;
  String job;
  String? createdAt;

  UserCreate({
    this.id,
    required this.name,
    required this.job,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'job': job};
  }

  factory UserCreate.fromJson(Map<String, dynamic> data) {
    final timestamp = data['createdAt'];
    final dateFormat = DateFormat('yyyy-mm-ddThh:mm:ss');
    final convertToDateTime = dateFormat.parse(timestamp);
    final result = DateFormat.yMd().add_jm().format(convertToDateTime);
    return UserCreate(
      id: data['id'],
      name: data['name'],
      job: data['job'],
      createdAt: result,
    );
  }

  @override
  String toString() {
    return 'User={id=$id, name=$name, job=$job, createdAt=$createdAt}';
  }
}

class UserUpdate extends UserCreate {
  String? updatedAt;

  UserUpdate({
    required super.name,
    required super.job,
    this.updatedAt,
  });

  factory UserUpdate.fromJson(Map<String, dynamic> data) {
    final timestamp = data['updatedAt'];
    final dateFormat = DateFormat('yyyy-mm-ddThh:mm:ss');
    final convertToDateTime = dateFormat.parse(timestamp);
    final result = DateFormat.yMd().add_jm().format(convertToDateTime);
    return UserUpdate(
      name: data['name'],
      job: data['job'],
      updatedAt: result,
    );
  }

  @override
  String toString() {
    return 'User={name=$name, job=$job, updatedAt=$updatedAt}';
  }
}
