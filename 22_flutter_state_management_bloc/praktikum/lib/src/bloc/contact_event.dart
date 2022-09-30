import 'package:equatable/equatable.dart';
import '../model/contact_mode.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => List.empty();
}

class CreateContact extends ContactEvent {
  final ContactModel contact;

  CreateContact({
    required this.contact,
  });
}

class RemoveContact extends ContactEvent {
  final ContactModel contact;

  RemoveContact({
    required this.contact,
  });
}

class FailedContact extends ContactEvent {}
