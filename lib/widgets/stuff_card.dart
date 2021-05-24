import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memstuff/helpers/date_helper.dart';
import '../models/stuff_model.dart';
import 'package:memstuff/helpers/phone_services.dart';
import 'package:memstuff/helpers/service_locator.dart';

class StuffCard extends StatelessWidget {

  final StuffModel stuff;
  final Function(StuffModel) onUpdate;
  final Function(StuffModel) onDelete;

  const StuffCard({
    Key key,
    this.stuff,
    this.onUpdate,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Excluir',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => onDelete(stuff),
          )
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
          caption: 'Ligar',
          color:Colors.green,
          icon: Icons.phone,
          onTap: () => _callPhoneService(stuff.phone),
          )
        ],
      child: buildCard(),
    );
  }

  _callPhoneService(String number){
    final PhoneServices _services = locator<PhoneServices>();
    _services.call(number);
  }

  buildCard() {
    return InkWell(
      onTap: () => onUpdate(stuff),
      child: Container(
        child: ListTile(
          title: Text(stuff.description ?? ''),
          subtitle: Text(stuff.contactName ?? ''),
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            backgroundImage: FileImage(File(stuff.photoPath)),
            //child: stuff.photoPath.isEmpty ? Text( stuff.description[0]) : null,
            child:stuff.photoPath.isEmpty ? Text( stuff.description[0],style: TextStyle(color: Colors.white)) : null,
          ),
          trailing: Container(
            padding: const EdgeInsets.only(top: 10),
            height: double.infinity,
            child: Text(DateHelper.toRelativeDate(stuff.date)),
          ),
        ),
      ),
    );
  }
}
