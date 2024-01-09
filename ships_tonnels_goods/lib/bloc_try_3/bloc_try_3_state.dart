part of 'bloc_try_3_bloc.dart';

class Try3State extends Equatable {
  final List<Ship> shipList;
  const Try3State({required this.shipList});


  Try3State copyWith({
    List<Ship>? shipList
  }) {
    return Try3State(
      shipList: shipList ?? this.shipList,
    );
  }

  @override
  List<Object?> get props => [
    shipList
  ];
}