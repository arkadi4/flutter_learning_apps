import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ships_tonnels_goods/bloc_try_3/bloc_try_3_bloc.dart';

class HomeScreenTry3 extends StatefulWidget {
  const HomeScreenTry3({super.key, required this.title});
  final String title;

  @override
  State<HomeScreenTry3> createState() => _HomeScreenTry3State();
}

class _HomeScreenTry3State extends State<HomeScreenTry3> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:BlocProvider(
          create: (context) => Try3Bloc()..add(Generate()),
          child: Column(
            children: [
              BlocBuilder<Try3Bloc, Try3State>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.shipList.length,
                      itemBuilder: (context, count) {
                        return Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Ship number: ${state.shipList[count].shipNumber} -'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Goods : ${state.shipList[count].goodsType} -'),
                                  Text('Capacity: ${state.shipList[count].capacity} - '),
                                  Text('Ship speed: ${double.parse((state.shipList[count].speed).toStringAsFixed(1))} -'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('shipStatus : ${state.shipList[count].shipStatus} -'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('In sea : ${double.parse((state.shipList[count].progressInSea).toStringAsFixed(1))} -'),
                                  Text('In tunnel : ${double.parse((state.shipList[count].progressInTunnel).toStringAsFixed(1))} -'),
                                  Text('loading : ${double.parse((state.shipList[count].loadingProgress).toStringAsFixed(1))} -'),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
