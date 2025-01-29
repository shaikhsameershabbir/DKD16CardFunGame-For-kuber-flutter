part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSocketConnected extends AuthState {}

class AuthSocketDisconnected extends AuthState {}

class AuthSocketError extends AuthState {
  final String errorMessage;
  AuthSocketError(this.errorMessage);
}

class AuthLoginSuccess extends AuthState {
  final Map<String, dynamic> userData;
  AuthLoginSuccess(this.userData);
}

class AuthLoginFailure extends AuthState {
  final String errorMessage;
  AuthLoginFailure(this.errorMessage);
}

class AuthLoggedOut extends AuthState {}

class AuthBalanceUpdated extends AuthState {
  final String balance;
  AuthBalanceUpdated(this.balance);
}

// New state for handling current draw tickets
class AuthCurrentDrawTicketsLoaded extends AuthState {
  final List<Map<String, dynamic>> tickets;
  AuthCurrentDrawTicketsLoaded(this.tickets);
}
