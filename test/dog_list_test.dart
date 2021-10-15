import 'package:flutter_technical_test/models/dog_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Dog data verification", () {
    final DogModel dogModel = DogModel();
    test("Dog list should be set", () async {
      await dogModel.fetchDogList();
      expect(dogModel.dogList.isEmpty, false);
    });
  });
}
