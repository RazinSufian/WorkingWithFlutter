import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/GeographicEntiyModel.dart';
import '../../view_model/GeographicEntityViewMode.dart';

class UpdateEntityForm extends StatefulWidget {
  @override
  _UpdateEntityFormState createState() => _UpdateEntityFormState();
}

class _UpdateEntityFormState extends State<UpdateEntityForm> {
  Entity? _selectedEntity;
  String? _title;
  double? _lat;
  double? _lon;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchEntities();
  }

  void _fetchEntities() async {
    setState(() {
      _isLoading = true;
    });

    await Provider.of<GeographicEntityViewModel>(context, listen: false).fetchEntities();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Entities'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _fetchEntities();
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<GeographicEntityViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.entities.isEmpty) {
            return Center(child: Text('No entities available'));
          }
          return Stack(
            children: [
              ListView.builder(
                itemCount: viewModel.entities.length,
                itemBuilder: (context, index) {
                  return UpdateEntityItem(
                    entity: viewModel.entities[index],
                    onEdit: _onEdit,
                  );
                },
              ),
              if (_selectedEntity != null) _buildEditCard(context),
            ],
          );
        },
      ),
    );
  }

  void _onEdit(Entity entity) {
    setState(() {
      _selectedEntity = entity;
      _title = entity.title;
      _lat = entity.lat;
      _lon = entity.lon;
    });
  }

  Widget _buildEditCard(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.grey[300], // Gray background
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Edit Entity', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _selectedEntity = null;
                        });
                      },
                    ),
                  ],
                ),
                TextFormField(
                  initialValue: _selectedEntity!.id.toString(),
                  decoration: InputDecoration(labelText: 'ID'),
                  readOnly: true,
                ),
                TextFormField(
                  initialValue: _title,
                  decoration: InputDecoration(labelText: 'Title'),
                  onChanged: (value) {
                    setState(() {
                      _title = value;
                    });
                  },
                ),
                TextFormField(
                  initialValue: _lat.toString(),
                  decoration: InputDecoration(labelText: 'Latitude'),
                  onChanged: (value) {
                    setState(() {
                      _lat = double.parse(value);
                    });
                  },
                ),
                TextFormField(
                  initialValue: _lon.toString(),
                  decoration: InputDecoration(labelText: 'Longitude'),
                  onChanged: (value) {
                    setState(() {
                      _lon = double.parse(value);
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Upload'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_selectedEntity != null) {
      Map<String, dynamic> updatedData = {
        'id': _selectedEntity!.id,
        'title': _title!,
        'lat': _lat!,
        'lon': _lon!,
      };

      Entity updatedEntity = Entity(
        id: updatedData['id'],
        title: updatedData['title'],
        lat: updatedData['lat'],
        lon: updatedData['lon'],
        image: _selectedEntity!.image,
      );

      await Provider.of<GeographicEntityViewModel>(context, listen: false).updateEntity(updatedEntity);
      _fetchEntities();
      setState(() {
        _selectedEntity = null;
      });
    }
  }
}

class UpdateEntityItem extends StatelessWidget {
  final Entity entity;
  final ValueChanged<Entity> onEdit;

  UpdateEntityItem({required this.entity, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: entity.id.toString(),
              decoration: InputDecoration(labelText: 'ID'),
              readOnly: true,
            ),
            TextFormField(
              initialValue: entity.title,
              decoration: InputDecoration(labelText: 'Title'),
              readOnly: true,
            ),
            TextFormField(
              initialValue: entity.lat.toString(),
              decoration: InputDecoration(labelText: 'Latitude'),
              readOnly: true,
            ),
            TextFormField(
              initialValue: entity.lon.toString(),
              decoration: InputDecoration(labelText: 'Longitude'),
              readOnly: true,
            ),
            Image.network('https://labs.anontech.info/cse489/t3/${entity.image}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onEdit(entity);
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
