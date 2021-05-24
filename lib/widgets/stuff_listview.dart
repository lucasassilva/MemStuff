import 'package:flutter/material.dart';
import 'package:memstuff/models/stuff_model.dart';

class StuffListView extends StatelessWidget {
  final bool loading;
  final int itemCount;
  final StuffModel stuff;
  final Widget Function(BuildContext, int index ) itemBuilder;

  const StuffListView({
    Key key,
    this.loading,
    this.itemCount,
    this.itemBuilder, this.stuff,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    if (loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (itemCount == 0) {
      return Center(
        child: Text(
          'Sem empréstimos.',
          style: TextStyle(color: Colors.black26),
        ),
      );
    }

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );

  }
}
