import 'package:application_lifecycle/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateCounter extends StatefulWidget {
  const UpdateCounter({super.key});

  @override
  State<UpdateCounter> createState() => _UpdateCounterState();
}

class _UpdateCounterState extends State<UpdateCounter> {
  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('To do arguments'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')
                ),
                const SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: () {
                    viewModel.updateButtonHandler(context);
                  },
                  child: const Text('Update')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
