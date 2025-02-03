abstract class CountersaleNettotpayState {}

class CountersaleNettotpayStateInitial extends CountersaleNettotpayState {}

class CountersaleNettotpayStateUpdated extends CountersaleNettotpayState {
  final List<dynamic> data;
  CountersaleNettotpayStateUpdated(this.data);

  @override
  List<Object> get props => [data];
}

class CountersaleNettotpayStateError extends CountersaleNettotpayState {
  final String message;
  CountersaleNettotpayStateError(this.message);
}
