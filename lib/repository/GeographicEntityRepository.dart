import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../models/GeographicEntiyModel.dart';

class GeographicEntityRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<List<Entity>> fetchEntities() async {
    try {
      final response = await _apiServices.getGetApiResponse("https://labs.anontech.info/cse489/t3/api.php");
      print(response);
      return (response as List).map((entity) => Entity.fromJson(entity)).toList();
    } catch (e) {
      throw e;
    }
  }

  // Future<Entity> createEntity(Entity entity) async {
  //   try {
  //     final response = await _apiServices.getPostFormDataApiResponse("https://labs.anontech.info/cse489/t3/api.php", entity.toJson(includeId: false));
  //     print("response from post: $response");
  //     return Entity.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<Entity> createEntity(Entity entity) async {
    try {
      final response = await _apiServices.getPostFormDataApiResponse(
          "https://labs.anontech.info/cse489/t3/api.php",
          entity.toJson(includeId: false)
      );
      print("response from post: $response");
      return Entity.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  // Future<Entity> updateEntity(Map<String, dynamic> entityData) async {
  //   try {
  //     final response = await _apiServices.putApiResponse(
  //       "https://labs.anontech.info/cse489/t3/api.php",
  //       entityData,
  //     );
  //     return Entity.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<Entity> updateEntity(Map<String, dynamic> data) async {
    final response = await _apiServices.getPutwwwFormDataApiResponse(
      "https://labs.anontech.info/cse489/t3/api.php",
      data,
    );
    print("response from put repo: $response");
    return Entity.fromJson(response);
  }

  // Future<Entity> updateEntityWithFormData(Entity entity) async {
  //   try {
  //     final response = await _apiServices.getPutFormDataApiResponse(
  //       "https://labs.anontech.info/cse489/t3/api.php",
  //       entity.toJson(),
  //     );
  //     return Entity.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
