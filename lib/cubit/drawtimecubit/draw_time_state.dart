abstract class DrawTimeState {}

class DrawTimeInitial extends DrawTimeState {}

class DrawTimeLoaded extends DrawTimeState {
  final String drawTime;
  final String drawDate;
  DrawTimeLoaded(this.drawTime, this.drawDate);
  @override
  List<Object> get props => [drawTime, drawDate];
}

class DrawTimeSocketError extends DrawTimeState {
  final String errorMessage;
  DrawTimeSocketError(this.errorMessage);
}
