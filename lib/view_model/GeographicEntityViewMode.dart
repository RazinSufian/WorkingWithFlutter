import 'package:flutter/material.dart';
import '../models/GeographicEntiyModel.dart';
import '../repository/GeographicEntityRepository.dart';

class GeographicEntityViewModel with ChangeNotifier {
  final GeographicEntityRepository _repository = GeographicEntityRepository();
  List<Entity> _entities = [];

  List<Entity> get entities => _entities;

  Future<void> fetchEntities() async {
    try {
      _entities = await _repository.fetchEntities();
      print('Entities fetched: $_entities');
      notifyListeners();
    } catch (e) {
      print('Error fetching entities: $e');
    }
  }

  // Future<void> createEntity(Entity entity) async {
  //   try {
  //     print("in the post view model");
  //     print(entity.toJson(includeId: false)); // Don't include the id in the POST request
  //     await _repository.createEntity(entity);
  //     fetchEntities(); // Refresh the list after creating a new entity
  //   } catch (e) {
  //     print("Error creating entity: $e");
  //   }
  // }

  Future<Entity> createEntity(Entity entity) async {
    try {
      print("in the post view model");
      print(entity.toJson(includeId: false)); // Don't include the id in the POST request
      final createdEntity = await _repository.createEntity(entity);
      fetchEntities(); // Refresh the list after creating a new entity
      return createdEntity;
    } catch (e) {
      print("Error creating entity: $e");
      rethrow;
    }
  }

  Future<void> updateEntity(Entity entity) async {
    try {
      print("inside update entity view model");
      print(entity.toJson(includeId: true, includeImage: false));
      var response = await _repository.updateEntity(entity.toJson(includeId: true, includeImage: false));
      print(" from update  view model");
      print(response);
      notifyListeners();
      // fetchEntities();
    } catch (e) {
      print('Error updating entity: $e');
    }
  }

  // Future<void> updateEntity(Entity entity, {bool isMultipart = false}) async {
  //   try {
  //     if (isMultipart) {
  //       await _repository.updateEntityWithFormData(entity);
  //     } else {
  //       print("inside update entity view model");
  //       print(entity.toJson(includeId: true, includeImage: false));
  //       await _repository.updateEntity(entity.toJson(includeId: true, includeImage: false));
  //     }
  //     fetchEntities();
  //   } catch (e) {
  //     print('Error updating entity: $e');
  //   }
  // }
}
