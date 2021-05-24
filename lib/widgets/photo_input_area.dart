import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoInputArea extends StatefulWidget {
  final double height;
  final double radius;
  final String label;
  final String initialValue;
  final Function(String) onChanged;

  const PhotoInputArea({
    Key key,
    this.height = 180.0,
    this.radius = 10.0,
    this.label,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _PhotoInputAreaState createState() => _PhotoInputAreaState();
}

class _PhotoInputAreaState extends State<PhotoInputArea> {
  final _picker = ImagePicker();
  File _image;

  @override
  void initState() {
    if (widget.initialValue.isNotEmpty) {
      _image = File(widget.initialValue);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onCapturePhoto,
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Center(
          child: _image == null ? Text(widget.label) : Image.file(_image),
        ),
      ),
    );
  }

  Future _onCapturePhoto() async {
    final file = await _picker.getImage(source: ImageSource.camera);
    if (file != null) {
      setState(() => _image = File(file.path));
      widget?.onChanged(_image.path);
    }
  }
}
