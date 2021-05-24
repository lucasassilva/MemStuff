import 'package:memstuff/models/stuff_model.dart';
import 'package:memstuff/repositories/stuff_repository.dart';

class DetailStuffController {
  
  final StuffRepository _repository;

  DetailStuffController(this._repository);

  int id;
  String description;
  String name;
  String date;
  String photo;
  String phone;

  setId(int value) => id = value;
  setDescription(String value) => description = value;
  setName(String value) => name = value;
  setDate(String value) => date = value;
  setPhoto(String value) => photo = value;
  setPhone(String value) => phone = value;

  Future save() async {
    StuffModel stuff = StuffModel(
      id: id,
      description: description ?? '',
      contactName: name ?? '',
      date: date ?? '',
      photoPath: photo ?? '',
      phone: phone ?? ''
    );

    if (id == null) {
      await _repository.create(stuff);
    } else {
      await _repository.update(stuff);
    }
  }
}
