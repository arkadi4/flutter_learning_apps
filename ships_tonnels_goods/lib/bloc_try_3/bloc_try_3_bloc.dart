import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ships_tonnels_goods/ship_management.dart';
import '../ship_object.dart';

part 'bloc_try_3_event.dart';
part 'bloc_try_3_state.dart';

class Try3Bloc extends Bloc<Try3Event, Try3State> {
  Try3Bloc() : super(const Try3State(shipList: [])) {
    on<Generate>(_onGenerate);
    on<FirstEvent>(_onFirstEvent);
    on<ReachedTheTunnel>(_onReachedTheTunnel);
    on<BreadLoading>(_onBreadLoading);
    on<BananaLoading>(_onBananaLoading);
    on<ClothesLoading>(_onClothesLoading);
  }

  _onGenerate(Generate event, Emitter<Try3State> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    List <Ship> temporaryObjectToCompareState = ShipManagement.createRandomShipsForTry3();
    ShipManagement.shipsListGlobal = temporaryObjectToCompareState;
    emit(Try3State(shipList: temporaryObjectToCompareState));
    for (Ship ship in ShipManagement.shipsListGlobal) {
      add(FirstEvent(ship: ship));
    }
  }

  _onFirstEvent(FirstEvent event, Emitter<Try3State> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    List<Ship> temporaryObjectToCompareState = ShipManagement.returnListWithSameShips(ShipManagement.shipsListGlobal);
    temporaryObjectToCompareState[event.ship.shipNumber - 1].progressInSea += event.ship.speed / event.ship.distanceToTheTunnel * 100;
    temporaryObjectToCompareState[event.ship.shipNumber - 1].shipStatus = 'somewhere in the sea, moving';
    ShipManagement.shipsListGlobal = temporaryObjectToCompareState;
    if (temporaryObjectToCompareState[event.ship.shipNumber - 1].progressInSea < 100) {
      emit(Try3State(shipList: temporaryObjectToCompareState));
      add(FirstEvent(ship: ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]));
    } else {
      temporaryObjectToCompareState[event.ship.shipNumber - 1].progressInSea = 100.0;
      if (ShipManagement.shipsInTunnel.length <= 4) {
        ShipManagement.shipsInTunnel.add(temporaryObjectToCompareState[event.ship.shipNumber - 1]);
        emit(Try3State(shipList: temporaryObjectToCompareState));
        add(ReachedTheTunnel(ship: ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]));
      } else {
        temporaryObjectToCompareState[event.ship.shipNumber - 1].shipStatus = 'waiting in queue before the tunnel';
        ShipManagement.queueBeforeTunnel.add(temporaryObjectToCompareState[event.ship.shipNumber - 1]);
        emit(Try3State(shipList: temporaryObjectToCompareState));
      }
    }
  }

  _onReachedTheTunnel(ReachedTheTunnel event, Emitter<Try3State> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    List<Ship> temporaryList = ShipManagement.returnListWithSameShips(ShipManagement.shipsListGlobal);
    temporaryList[event.ship.shipNumber - 1].progressInTunnel += event.ship.speed / event.ship.tunnelLength * 100;
    temporaryList[event.ship.shipNumber - 1].shipStatus = 'in the tunnel, moving';
    ShipManagement.shipsListGlobal = temporaryList;
    if (temporaryList[event.ship.shipNumber - 1].progressInTunnel < 100) {
      emit(Try3State(shipList: temporaryList));
      add(ReachedTheTunnel(ship: ShipManagement.shipsListGlobal[event.ship.shipNumber -1]));
    } else {
      temporaryList[event.ship.shipNumber - 1].progressInTunnel = 100.0;
      emit(Try3State(shipList: temporaryList));
      ShipManagement.shipsInTunnel.remove(temporaryList[event.ship.shipNumber - 1]);
      if (temporaryList[event.ship.shipNumber - 1].goodsType == 'Bread') {
        if (ShipManagement.isBreadDockBusy == false) {
          ShipManagement.isBreadDockBusy = true;
          add(BreadLoading(ship: ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]));
        } else {
          temporaryList[event.ship.shipNumber - 1].shipStatus = 'waiting for loading';
          ShipManagement.queueBread.add(ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]);
        }
      } else if (temporaryList[event.ship.shipNumber - 1].goodsType == 'Banana') {
        if (ShipManagement.isBananaDockBusy == false) {
          ShipManagement.isBananaDockBusy = true;
          add(BananaLoading(ship: ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]));
        } else {
          temporaryList[event.ship.shipNumber - 1].shipStatus = 'waiting for loading';
          ShipManagement.queueBanana.add(ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]);
        }
      } else if (temporaryList[event.ship.shipNumber - 1].goodsType == 'Clothes') {
        if (ShipManagement.isClothesDockBusy == false) {
          ShipManagement.isClothesDockBusy = true;
          add(ClothesLoading(ship: ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]));
        } else {
          temporaryList[event.ship.shipNumber - 1].shipStatus = 'waiting for loading';
          ShipManagement.queueClothes.add(ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]);
        }
      }

      if (ShipManagement.queueBeforeTunnel.isNotEmpty) {
        add(ReachedTheTunnel(ship: ShipManagement.queueBeforeTunnel[0]));
        ShipManagement.shipsInTunnel.add(ShipManagement.queueBeforeTunnel[0]);
        ShipManagement.queueBeforeTunnel.removeAt(0);
      }
    }
  }

  _onBreadLoading(BreadLoading event, Emitter<Try3State> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    List<Ship> temporaryList = ShipManagement.returnListWithSameShips(ShipManagement.shipsListGlobal);
    temporaryList[event.ship.shipNumber - 1].shipStatus = 'loading bread';
    temporaryList[event.ship.shipNumber - 1].loadingProgress += event.ship.loadingSpeed / event.ship.capacity * 100;
    if ( temporaryList[event.ship.shipNumber - 1].loadingProgress < 100) {
      ShipManagement.shipsListGlobal = temporaryList;
      emit(Try3State(shipList: temporaryList));
      add(BreadLoading(ship: ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]));
    } else {
      temporaryList[event.ship.shipNumber - 1].loadingProgress = 100;
      temporaryList[event.ship.shipNumber - 1].shipStatus = 'finished';
      ShipManagement.isBreadDockBusy = false;
      ShipManagement.shipsListGlobal = temporaryList;
      emit(Try3State(shipList: temporaryList));
      if (ShipManagement.queueBread.isNotEmpty) {
        ShipManagement.isBreadDockBusy = true;
        add(BreadLoading(ship: ShipManagement.queueBread[0]));
        ShipManagement.queueBread.removeAt(0);
      }
    }
  }

  _onBananaLoading(BananaLoading event, Emitter<Try3State> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    List<Ship> temporaryList = ShipManagement.returnListWithSameShips(ShipManagement.shipsListGlobal);
    temporaryList[event.ship.shipNumber - 1].shipStatus = 'loading bananas';
    temporaryList[event.ship.shipNumber - 1].loadingProgress += event.ship.loadingSpeed / event.ship.capacity * 100;
    if ( temporaryList[event.ship.shipNumber - 1].loadingProgress < 100) {
      ShipManagement.shipsListGlobal = temporaryList;
      emit(Try3State(shipList: temporaryList));
      add(BananaLoading(ship: ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]));
    } else {
      temporaryList[event.ship.shipNumber - 1].loadingProgress = 100;
      temporaryList[event.ship.shipNumber - 1].shipStatus = 'finished';
      ShipManagement.shipsListGlobal = temporaryList;
      ShipManagement.isBananaDockBusy = false;
      emit(Try3State(shipList: temporaryList));
      if (ShipManagement.queueBanana.isNotEmpty) {
        ShipManagement.isBananaDockBusy = true;
        add(BananaLoading(ship: ShipManagement.queueBanana[0]));
        ShipManagement.queueBanana.removeAt(0);
      }
    }
  }

  _onClothesLoading(ClothesLoading event, Emitter<Try3State> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    List<Ship> temporaryList = ShipManagement.returnListWithSameShips(ShipManagement.shipsListGlobal);
    temporaryList[event.ship.shipNumber - 1].shipStatus = 'loading clothes';
    temporaryList[event.ship.shipNumber - 1].loadingProgress += event.ship.loadingSpeed / event.ship.capacity * 100;
    if ( temporaryList[event.ship.shipNumber - 1].loadingProgress < 100) {
      ShipManagement.shipsListGlobal = temporaryList;
      emit(Try3State(shipList: temporaryList));
      add(ClothesLoading(ship: ShipManagement.shipsListGlobal[event.ship.shipNumber - 1]));
    } else {
      temporaryList[event.ship.shipNumber - 1].loadingProgress = 100;
      temporaryList[event.ship.shipNumber - 1].shipStatus = 'finished';
      ShipManagement.isClothesDockBusy = false;
      ShipManagement.shipsListGlobal = temporaryList;
      emit(Try3State(shipList: temporaryList));
      if (ShipManagement.queueClothes.isNotEmpty) {
        ShipManagement.isClothesDockBusy = true;
        add(ClothesLoading(ship: ShipManagement.queueClothes[0]));
        ShipManagement.queueClothes.removeAt(0);
        ShipManagement.isClothesDockBusy = true;
      }
    }
  }
}