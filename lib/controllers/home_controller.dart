import '../models/stuff_model.dart';
import '../repositories/stuff_repository.dart';

class HomeController {
  final StuffRepository _repository;
  final List<StuffModel> stuffs = <StuffModel>[];

  HomeController(this._repository);

  int get length => stuffs.length;

  bool loading = false;

  Future<void> readAll() async {
    loading = true;
    final result = await _repository.readAll();
    stuffs.clear();
    stuffs.addAll(result);
    loading = false;
  }

  Future delete(StuffModel stuff) async {
    loading = true;
    await _repository.delete(stuff);
    loading = false;
  }
}
