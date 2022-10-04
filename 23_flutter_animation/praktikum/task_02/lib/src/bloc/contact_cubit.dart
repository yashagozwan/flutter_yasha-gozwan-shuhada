import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/contact_model.dart';

class ContactCubit extends Cubit<List<ContactModel>> {
  ContactCubit() : super([]);

  void addContact(ContactModel contact) {
    var contacts = List.of(state);
    contacts.add(contact);
    emit(contacts);
  }

  void removeContact(ContactModel contact) {
    var contacts = List.of(state);
    contacts.remove(contact);
    emit(contacts);
  }

  void updateContact(ContactModel contact) {
    var contacts = List.of(state);
    var currentContact = contacts.firstWhere((e) => e.id == contact.id);
    var index = contacts.indexOf(currentContact);
    contacts[index] = contact;
    emit(contacts);
  }
}
