import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../models/GeographicEntiyModel.dart';
import '../../view_model/GeographicEntityViewMode.dart';

class EntityForm extends StatefulWidget {
  final Entity? entity;

  EntityForm({this.entity});

  @override
  _EntityFormState createState() => _EntityFormState();
}

class _EntityFormState extends State<EntityForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  double _lat = 0.0;
  double _lon = 0.0;
  XFile? _image;

  @override
  void initState() {
    super.initState();
    if (widget.entity != null) {
      _title = widget.entity!.title;
      _lat = widget.entity!.lat;
      _lon = widget.entity!.lon;
      _image = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entity == null ? 'Create Entity' : 'Edit Entity'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                initialValue: _lat.toString(),
                decoration: InputDecoration(labelText: 'Latitude'),
                onSaved: (value) => _lat = double.parse(value!),
              ),
              TextFormField(
                initialValue: _lon.toString(),
                decoration: InputDecoration(labelText: 'Longitude'),
                onSaved: (value) => _lon = double.parse(value!),
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Select Image'),
              ),
              _image != null ? Image.file(File(_image!.path)) : Container(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//
//       String imagePath = _image?.path ?? widget.entity?.image ?? '';
//
//       Entity entity = Entity(
//         id: widget.entity?.id ?? 0,
//         title: _title,
//         lat: _lat,
//         lon: _lon,
//         image: imagePath,
//       );
//
//       if (widget.entity == null) {
//         print("in the submit form: $widget.entity");
//         Provider.of<GeographicEntityViewModel>(context, listen: false).createEntity(entity);
//       } else {
//         Provider.of<GeographicEntityViewModel>(context, listen: false).createEntity(entity);
//       }
//       Navigator.of(context).pop();
//     }
//   }
// }


  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String imagePath = _image?.path ?? widget.entity?.image ?? '';

      Entity entity = Entity(
        id: widget.entity?.id ?? 0,
        title: _title,
        lat: _lat,
        lon: _lon,
        image: imagePath,
      );

      // Validate required fields
      if (entity.title.isEmpty || entity.lat == 0 || entity.lon == 0 || entity.image.isEmpty) {
        Flushbar(
          message: "All fields (Title, Latitude, Longitude, Image) are required.",
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ).show(context);
        return;
      }

      try {
        // Create entity using view model and handle the response
        final createdEntity = await Provider.of<GeographicEntityViewModel>(context, listen: false)
            .createEntity(entity);

        Flushbar(
          message: "New entity created successfully with ID: ${createdEntity.id}",
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
          onStatusChanged: (FlushbarStatus? status) {
            if (status == FlushbarStatus.DISMISSED) {
              Navigator.of(context).pop();
            }
          },
        ).show(context);
      } catch (e) {
        Flushbar(
          message: "Error creating entity: $e",
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ).show(context);
      }
    }
  }
}