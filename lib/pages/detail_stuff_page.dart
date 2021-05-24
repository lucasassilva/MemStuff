import 'package:flutter/material.dart';
import 'package:memstuff/controllers/detail_stuff_controller.dart';
import 'package:memstuff/core/app_const.dart';
import 'package:memstuff/helpers/snackbar_helper.dart';
import 'package:memstuff/models/stuff_model.dart';
import 'package:memstuff/repositories/stuff_repository_impl.dart';
import 'package:memstuff/widgets/date_input_field.dart';
import 'package:memstuff/widgets/description_input_field.dart';
import 'package:memstuff/widgets/loading_dialog.dart';
import 'package:memstuff/widgets/name_input_field.dart';
import 'package:memstuff/widgets/phone_input_field.dart';
import 'package:memstuff/widgets/photo_input_area.dart';
import 'package:memstuff/widgets/primary_button.dart';

class DetailStuffPage extends StatefulWidget {
  final StuffModel stuff;

  const DetailStuffPage({
    Key key,
    this.stuff,
  }) : super(key: key);

  @override
  _DetailStuffPageState createState() => _DetailStuffPageState();
}

class _DetailStuffPageState extends State<DetailStuffPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = DetailStuffController(StuffRepositoryImpl());

  @override
  void initState() {
    _controller.setId(widget.stuff?.id);
    _controller.setPhoto(widget.stuff?.photoPath ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kAppDetailTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: _buildForm(),
      ),
    );
  }

  _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PhotoInputArea(
            label: 'sem foto',
            initialValue: _controller.photo,
            onChanged: _controller.setPhoto,
          ),
          DescriptionInputField(
            icon: Icons.description,
            label: 'Descrição',
            initialValue: widget.stuff?.description ?? '',
            onSaved: _controller.setDescription,
          ),
          NameInputField(
            icon: Icons.person,
            label: 'Nome',
            initialValue: widget.stuff?.contactName ?? '',
            onSaved: _controller.setName,
          ),
          PhoneInputField(
            icon: Icons.phone,
            label: 'Telefone',
            initialValue: widget.stuff?.phone ?? '',
            onSaved: _controller.setPhone,
          ),
          DateInputField(
            label: 'Data',
            initialValue: widget.stuff?.date ?? '',
            onSaved: _controller.setDate,
          ),
          PrimaryButton(
            label: 'Salvar',
            onPressed: _onSave,
          ),
        ],
      ),
    );
  }

  _onSave() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      LoadingDialog.show(context, message: 'Salvando...');
      await _controller.save();
      LoadingDialog.hide();
      Navigator.of(context).pop();

      if (_controller.id == null) {
        SnackbarHelper.showCreateMessage(
          context: context,
          message: '${_controller.description} criado com sucesso!',
        );
      } else {
        SnackbarHelper.showUpdateMessage(
          context: context,
          message: '${_controller.description} atualizado com sucesso!',
        );
      }
    }
  }
}
