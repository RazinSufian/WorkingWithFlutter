import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'model/GeographicEntiyModel.dart';

import 'view_model/GeographicEntityViewMode.dart';
import 'CreatEditEntityForm.dart';

import 'UpdateEntity.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GoogleMapController? _mapController;
  int _selectedIndex = 0;
  bool _isLoading = false;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Create Entity'),
    Text('Update Entity'),
  ];

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _showCreateEntityForm(context);
      } else if (_selectedIndex == 1) {
        _showUpdateEntityForm(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geographic Entities'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _fetchEntities,
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<GeographicEntityViewModel>(
        builder: (context, viewModel, child) {
          print('Building MainScreen with ${viewModel.entities.length} entities');
          if (viewModel.entities.isEmpty) {
            return Center(child: Text('No entities available'));
          }
          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(23.6850, 90.3563),
              zoom: 7,
            ),
            markers: viewModel.entities.map((entity) {
              return Marker(
                markerId: MarkerId(entity.id.toString()),
                position: LatLng(entity.lat, entity.lon),
                infoWindow: InfoWindow(
                  title: entity.title,
                  snippet: 'Tap to view details',
                ),
                onTap: () {
                  _showEntityDetails(context, entity);
                },
              );
            }).toSet(),
            onLongPress: (LatLng position) {
              _showLatLngDialog(context, position);
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Entity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Update Entity',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {}); // Force rebuild to ensure the map is rendered
  }

  void _showEntityDetails(BuildContext context, Entity entity) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(entity.title),
        content: Image.network('https://labs.anontech.info/cse489/t3/${entity.image}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showUpdateEntityForm(context);
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  void _showCreateEntityForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EntityForm(),
      ),
    );
  }

  void _showUpdateEntityForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UpdateEntityForm(),
      ),
    );
  }

  void _showLatLngDialog(BuildContext context, LatLng position) {
    final TextEditingController latController = TextEditingController(text: position.latitude.toString());
    final TextEditingController lonController = TextEditingController(text: position.longitude.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Coordinates'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: latController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Latitude',
              ),
            ),
            TextField(
              controller: lonController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Longitude',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _navigateToCreateEntityForm(context, position.latitude, position.longitude);
            },
            child: Text('Create Entity'),
          ),
        ],
      ),
    );
  }

  void _navigateToCreateEntityForm(BuildContext context, double latitude, double longitude) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EntityForm(
          entity: Entity(
            id: 0,
            title: '',
            lat: latitude,
            lon: longitude,
            image: '',
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
