import 'package:flutter/material.dart';
import 'package:flutter_technical_test/models/dog_model.dart';
import 'package:provider/provider.dart';

class DogList extends StatelessWidget {
  const DogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DogModel dogs = Provider.of<DogModel>(context);
    return Container(
      child: ListView.builder(
        itemCount: dogs.dogList.length,
        itemBuilder: (context, index) {
          DogItem currentItem = dogs.dogList[index];
          return Container(
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(context: context, builder: (BuildContext context) {
                      return Container(
                        child: Column(
                          children: [
                            Image.network(currentItem.imageUrl),
                            Text(currentItem.lifeSpan, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                            Text(currentItem.temperament, style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 11),),
                            Text(currentItem.height, style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 11),),
                            Text(currentItem.weight, style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 11),),
                          ],
                        ),
                      );
                    });
                  },
              child: Card(
                elevation: 6,
                  margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.network(currentItem.imageUrl),
                    Text(currentItem.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  ],
                ),
                  )
              )
          );
        },
      ),
    );
  }
}
