import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:memstuff/helpers/snackbar_helper.dart';
import 'package:memstuff/models/stuff_model.dart';
import 'package:memstuff/pages/detail_stuff_page.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../controllers/home_controller.dart';
import '../core/app_const.dart';
import '../repositories/stuff_repository_impl.dart';
import '../widgets/stuff_card.dart';
import '../widgets/stuff_listview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(StuffRepositoryImpl());

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future _initialize() async {
    await _controller.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kAppTile)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onCreate,
      ),
      body: RefreshIndicator(
        onRefresh: _initialize,
        child: StuffListView(
          loading: _controller.loading,
          itemCount: _controller.length,
          itemBuilder: _buildCard,
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    final stuff = _controller.stuffs[index];
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        horizontalOffset: 150.0,
        child: FadeInAnimation(
          child: StuffCard(
            stuff: stuff,
            onUpdate: _onUpdate,
            onDelete: _onDelete,
          ),
        ),
      ),
    );
  }

  _onCreate() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailStuffPage()),
    );
    await _controller.readAll();
    setState(() {});
  }

  _onUpdate(StuffModel stuff) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailStuffPage(stuff: stuff),
      ),
    );
    await _controller.readAll();
    setState(() {});
  }

  _onDelete(StuffModel stuff) async {
    _controller.delete(stuff);
    await _controller.readAll();
    setState(() {});

    SnackbarHelper.showDeleteMessage(
      context: context,
      message: '${stuff.description} excluido!',
    );
  }
}
