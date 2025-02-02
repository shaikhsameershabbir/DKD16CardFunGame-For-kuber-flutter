abstract class DkdWinnerState {}

class DKDWinnerInitial extends DkdWinnerState {}

class DKDWinnerUpdated extends DkdWinnerState {
  final String winner;
  final String xvalue;
  DKDWinnerUpdated(this.winner, this.xvalue);

  @override
  List<Object> get props => [winner, xvalue];
}
