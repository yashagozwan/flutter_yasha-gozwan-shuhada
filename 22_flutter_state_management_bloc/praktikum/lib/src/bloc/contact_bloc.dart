import 'package:flutter_bloc/flutter_bloc.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(Initial(contacts: List.empty())) {
    on<ContactEvent>((event, emit) async {
      emit(Loading(contacts: state.contacts));

      await Future.delayed(const Duration(milliseconds: 2000));

      if (event is CreateContact) {
        emit(Loaded(contacts: [...state.contacts, event.contact]));
      }

      if (event is RemoveContact) {
        emit(Loaded(contacts: [...state.contacts]..remove(event.contact)));
      }

      if (event is FailedContact) {
        emit(Failed(contacts: state.contacts));
      }

      emit(Loaded(contacts: state.contacts));
    });
  }
}
