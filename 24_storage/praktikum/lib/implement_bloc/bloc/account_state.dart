import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../model/account_model.dart';

@immutable
abstract class AccountState extends Equatable {
  @override
  List<Object?> get props => List.empty();
}

class Initial extends AccountState {}

class Loading extends AccountState {}

class Success extends AccountState {
  final AccountModel? account;
  final bool? statusAction;
  final bool? isLogin;

  Success({
    this.account,
    this.isLogin,
    this.statusAction,
  });

  @override
  List<Object?> get props => [account, statusAction, isLogin];
}
