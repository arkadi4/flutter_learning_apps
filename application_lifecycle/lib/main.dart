import 'package:application_lifecycle/update_counter.dart';
import 'package:application_lifecycle/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: ViewModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lifecycle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routes: {
        '/counter' : (context) => const Counter(),
        '/update_counter' : (context) => const UpdateCounter(),
      },
      initialRoute: '/counter',
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> with WidgetsBindingObserver{
  DateTime timeInactive = DateTime.now();
  DateTime timeResumed = DateTime.now();
  int difference = 0;


  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    ViewModel viewModel = context.read<ViewModel>();
    switch (state) {
      case AppLifecycleState.inactive:
        print('inactive');
        await viewModel.increaseWhenInactive();
        timeInactive = DateTime.now();
      case AppLifecycleState.paused:
        print('paused');
      case AppLifecycleState.resumed:
        await viewModel.increaseWhenResume();
        print('resumed');
        timeResumed = DateTime.now();
        difference = 2 * timeResumed.difference(timeInactive).inSeconds;
        await viewModel.countLabelAfterTimeDifference(difference);
      case AppLifecycleState.detached:
        print('detached');
    }
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_){
      context.read<ViewModel>().readLabelFromSharedPreferences();
    });
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(viewModel.label.toDouble()),
                    color: Colors.yellow,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  height: MediaQuery.of(context).size.width - 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${viewModel.label}'),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/update_counter');
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                            foregroundColor: const MaterialStatePropertyAll(Colors.white),
                            shape: const MaterialStatePropertyAll(CircleBorder()),
                            fixedSize: MaterialStatePropertyAll(Size.fromRadius( (MediaQuery.of(context).size.width - 60) / 6) ),
                          ),
                          child: const Text('Tap'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
