part of 'bloc_try_3_bloc.dart';

abstract class Try3Event extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class Generate extends Try3Event {

}

class FirstEvent extends Try3Event {
  Ship ship;
  FirstEvent({required this.ship});

  @override
  List<Object?> get props => [ship];
}

class ReachedTheTunnel extends Try3Event {
  Ship ship;
  ReachedTheTunnel({required this.ship});

  @override
  List<Object?> get props => [ship];
}

class FinishedTheTunnel extends Try3Event {
  Ship ship;
  FinishedTheTunnel({required this.ship});

  @override
  List<Object?> get props => [ship];
}

class BreadLoading extends Try3Event {
  Ship ship;
  BreadLoading({required this.ship});

  @override
  List<Object?> get props => [ship];
}

class BananaLoading extends Try3Event {
  Ship ship;
  BananaLoading({required this.ship});

  @override
  List<Object?> get props => [ship];
}

class ClothesLoading extends Try3Event {
  Ship ship;
  ClothesLoading({required this.ship});

  @override
  List<Object?> get props => [ship];
}