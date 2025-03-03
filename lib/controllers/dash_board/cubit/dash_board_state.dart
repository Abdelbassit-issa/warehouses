// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dash_board_cubit.dart';

class DashBoardState extends Equatable {
  const DashBoardState({
    required this.items,
    required this.status,
    required this.errorMessage,
    required this.sec,
  });

  final List<Map<String, dynamic>> items;
  final DashboardStatus status;
  final String errorMessage;
  final String sec;
  factory DashBoardState.initial() => DashBoardState(
    items: [],
    status: DashboardStatus.dashboardInitialState,
    errorMessage: '',
    sec: '',
  );
  @override
  List<Object> get props => [items, status, errorMessage , sec] ;

  DashBoardState copyWith({
    List<Map<String, dynamic>>? items,
    DashboardStatus? status,
    String? errorMessage,
    String? sec,
  }) {
    return DashBoardState(
      items: items ?? this.items,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      sec: sec ?? this.sec,
    );
  }
}
