import 'package:equatable/equatable.dart';

class Ship extends Equatable{
  String goodsType;
  int capacity;
  int shipNumber;
  double speed;
  double loadingSpeed = 5.0;
  double distanceToTheTunnel;
  double progressInSea = 0.0;
  String shipStatus = '';
  double tunnelLength = 50.0;
  double progressInTunnel;
  double loadingProgress = 0.0;

  Ship(
    {
      required this.shipNumber,
      required this.capacity,
      required this.goodsType,
      required this.speed,
      required this.distanceToTheTunnel,
      required this.progressInSea,
      required this.shipStatus,
      required this.progressInTunnel,
      required this.loadingProgress,
    }
  );

  @override
  List<Object?> get props => [shipNumber, speed, progressInSea, progressInTunnel, loadingProgress, shipStatus];
}