abstract class FromAndToDateStateState {}

class FromAndToDateStateStateInitial extends FromAndToDateStateState {}

class FromDateStateStateLoaded extends FromAndToDateStateState {
  final String fromDate;
  FromDateStateStateLoaded(this.fromDate);
  @override
  List<Object> get props => [fromDate];
}

class ToDateStateStateLoaded extends FromAndToDateStateState {
  final String toDate;
  ToDateStateStateLoaded(this.toDate);
  @override
  List<Object> get props => [toDate];
}

class FromAndToDateStateStateError extends FromAndToDateStateState {
  final String errorMessage;
  FromAndToDateStateStateError(this.errorMessage);
}
