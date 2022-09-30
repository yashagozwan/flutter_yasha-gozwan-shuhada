import 'package:equatable/equatable.dart';
import '../model/contact_mode.dart';

abstract class ContactState extends Equatable {
  final List<ContactModel> contacts;

  const ContactState({required this.contacts});

  @override
  List<Object?> get props => [contacts];
}

class Initial extends ContactState {
  const Initial({required super.contacts});
}

class Loading extends ContactState {
  const Loading({required super.contacts});
}

class Loaded extends ContactState {
  const Loaded({required super.contacts});
}

class Failed extends ContactState {
  const Failed({required super.contacts});
}
