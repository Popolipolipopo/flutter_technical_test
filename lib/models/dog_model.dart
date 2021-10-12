import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DogModel extends ChangeNotifier {
  List<DogItem> _dogs = [];

  DogModel() {
    fetchDogList();
  }

  void fetchDogList() async {
    try {
      var response = await Dio().get("https://api.thedogapi.com/v1/breeds?limit=10", options: Options(
        headers: {
          "x-api-key": "cef59342-8afa-49e8-8de1-08a0eac85329"
        }
      ));
      for (int i = 0 ; i < response.data.length; i++) {
        _dogs.add(DogItem.fromJson(response.data[i]));
      }
      notifyListeners();
    } catch (e) {
    }
  }

  List<DogItem> get dogList => _dogs;

}

class DogItem {
  final int id;
  final String name;
  final String imageUrl;
  final String description;

  DogItem({required this.id, required this.name, required this.imageUrl, required this.description});

  factory DogItem.fromJson(Map<String, dynamic> json) {
    return DogItem(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image']['url'],
      description: json['temperament'],
    );
  }
}
