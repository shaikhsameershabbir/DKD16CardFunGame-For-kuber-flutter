abstract class PasswordChangeState {}

class PasswordChangeInitial extends PasswordChangeState {}

class PasswordChangedState extends PasswordChangeState {
  final String message;
  PasswordChangedState(this.message);
  @override
  List<Object> get props => [message];
}

class PasswordChangedStateError extends PasswordChangeState {
  final String errorMessage;
  PasswordChangedStateError(this.errorMessage);
}
