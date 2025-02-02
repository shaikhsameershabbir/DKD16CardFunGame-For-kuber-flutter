abstract class BalanceUpdateState {}

class BalanceInitial extends BalanceUpdateState {}

class BalanceLoaded extends BalanceUpdateState {
  final String balance;
  BalanceLoaded(this.balance);
  @override
  List<Object> get props => [balance];
}

class TimerAuthSocketError extends BalanceUpdateState {
  final String errorMessage;
  TimerAuthSocketError(this.errorMessage);
}
