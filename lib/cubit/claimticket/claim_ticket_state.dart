abstract class ClaimTicketState {}

class ClaimTicketInitial extends ClaimTicketState {}

class ClaimTicketLoaded extends ClaimTicketState {
  // final int ticket;
  // final bool success;
  // final int betTotal;
  // final String message;
  // final int winAmount;
  // final String drawTime;
  // final int winner;

  Map<String, dynamic> winnerData;
  // ClaimTicketLoaded(this.ticket, this.success, this.betTotal, this.message,
  //     this.winAmount, this.drawTime, this.winner);

  ClaimTicketLoaded(this.winnerData);
  @override
  List<Object> get props => [winnerData];
}

class TimerAuthSocketError extends ClaimTicketState {
  final String errorMessage;
  TimerAuthSocketError(this.errorMessage);
}
