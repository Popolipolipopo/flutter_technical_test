import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DogModel extends ChangeNotifier {
  List<DogItem> _dogs = [];

  DogModel() {
    fetchDogList();
  }

  void fetchDogList() async {
    try {
      var response = await Dio().get("https://api.thedogapi.com/v1/breeds?limit=30", options: Options(
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
  final String temperament;
  final String lifeSpan;
  final String height;
  final String weight;

  DogItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.temperament,
    required this.lifeSpan,
    required this.height,
    required this.weight
  });

  factory DogItem.fromJson(Map<String, dynamic> json) {
    return DogItem(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image']['url'],
      temperament: json['temperament'],
      lifeSpan: json['life_span'] ?? "Unknown",
      height: json['height']['metric'],
      weight: json['weight']['metric'],
    );
  }
}
