



import 'package:flutter/material.dart';
import 'package:mvvm_example/mvvm/to_do_item.dart';
import 'package:provider/provider.dart';

class _ModelState {
  final List<ToDoItem> items;

  _ModelState({
    this.items = const <ToDoItem>[],
  });

  _ModelState copyWith({
    List<ToDoItem>? items,
  }) {
    return _ModelState(
      items: items ?? this.items,
    );
  }
}

class _ViewModel extends ChangeNotifier {
  var _state = _ModelState();

  _ModelState get state => _state;
  set state(_ModelState value) {
    _state = _state.copyWith(items: value.items);
    notifyListeners();
  }

  addItem(ToDoItem item) {
    var list = state.items.toList();
    if (list.any((element) => element.name == item.name)) {
      throw Error();
    } else {
      list.add(item);
      state = state.copyWith(items: list);
    }
  }

  deleteItem (ToDoItem item) {
    var list = state.items.toList();
    list.removeWhere((element) => element.name == item.name);
    state = state.copyWith(items: list);
  }

  toggleItem(ToDoItem item) {
    var list = state.items.toList();
    var index = list.indexWhere((element) => element.name == item.name);
    list[index] = item.copyWith(done: !item.done);
    state = state.copyWith(items: list);
  }
}

class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var _viewModel = context.watch<_ViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo List"),
      ),
      body: ListView.builder(
        itemBuilder: (_, int index) => ToDoItemWidget(
          item: _viewModel.state.items[index],
          onDelete: _viewModel.deleteItem,
          onToogle: _viewModel.toggleItem,
        ),
        itemCount: _viewModel.state.items.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AddTaskDialog(onFinish: _viewModel.addItem),
          );
        },
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }

  // static Widget create() {
  //   ChangeNotifierProvider(
  //     create: (_) => _ViewModel(),
  //     child: const ToDoListWidget(),
  //   );
  // }

    static Widget create() => ChangeNotifierProvider(
      create: (_) => _ViewModel(),
      child: const ToDoListWidget(),
    );

}


class ToDoItemWidget extends StatelessWidget {
  final ToDoItem item;
  final Function(ToDoItem) onDelete;
  final Function(ToDoItem) onToogle;
  const ToDoItemWidget({
    Key? key,
    required this.item,
    required this.onDelete,
    required this.onToogle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        background: Container(color: Colors.red),
        key: Key(item.name),
        onDismissed: (_) {
          onDelete(item);
        },
        child: CheckboxListTile(
          value: item.done,
          onChanged: (_) {
            onToogle(item);
          },
          title: Text(item.name),
        ));
  }
}

class AddTaskDialog extends StatelessWidget {
  final ValueChanged<ToDoItem> onFinish;
  const AddTaskDialog({
    Key? key,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? text;
    return AlertDialog(
      title: const Text("Add new Task"),
      content: TextField(
          autofocus: true,
          onChanged: (String _text) {
            text = _text;
          }),
      actions: <Widget>[
        TextButton(
          child: const Text("Add"),
          onPressed: () {
            if (text != null) {
              try {
                onFinish(ToDoItem(name: text!));
                Navigator.of(context).pop();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Task ${text!} exist!")));
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Enter Task name")));
            }
          },
        ),
        TextButton(
          child: const Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}