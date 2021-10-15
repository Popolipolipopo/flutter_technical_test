import 'package:flutter/cupertino.dart';
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
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder: 'assets/images/dog_silhouette_placeholder.svg.png',
                                image: currentItem.imageUrl,
                              ),
                            ),
                            Center(
                              child : Card(
                                  elevation: 10,
                                  margin: EdgeInsets.all(10),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: const [
                                                  Text("Life span :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                                  Text("Temperament :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
                                                  Text("Height :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                                  Text("Weight :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                                ],
                                              ),
                                              VerticalDivider(),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(currentItem.lifeSpan, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),),
                                                  Text(currentItem.temperament, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15,)),
                                                  Text(currentItem.height + "cm", style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),),
                                                  Text(currentItem.weight + "kg", style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),),
                                                ],
                                              )
                                            ],
                                          )
                                      )
                                  )
                              ),
                            )
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/dog_silhouette_placeholder.svg.png',
                            image: currentItem.imageUrl,
                          ),
                        ),
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
