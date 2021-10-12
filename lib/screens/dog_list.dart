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
              child: ListTile(
                leading: Image.network(currentItem.imageUrl),
                title: Text(currentItem.name),
                onTap: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context) {
                    return Container(
                      child: Column(
                        children: [
                          Image.network(currentItem.imageUrl),
                          Text(currentItem.name),
                          Text(currentItem.description),
                        ],
                      ),
                    );
                  });
                },
              )
            );
          },
      ),
    );
  }
}
