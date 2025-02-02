abstract class GetAndViewResultState {}

class ResultLoadedInitial extends GetAndViewResultState {}

class ResultLoaded extends GetAndViewResultState {
  final List<Map<String, dynamic>> results;
  ResultLoaded(this.results);
  @override
  List<Object> get props => [results];
}

class TimerAuthSocketError extends GetAndViewResultState {
  final String errorMessage;
  TimerAuthSocketError(this.errorMessage);
}
