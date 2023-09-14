import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_doce/models/candy_model.dart';
import 'package:projeto_doce/pages/widgets/custom_dividers.dart';
import 'package:projeto_doce/utils/helpers.dart';
import 'package:url_launcher/url_launcher.dart';

class CandyPage extends StatefulWidget {
  const CandyPage({super.key});

  @override
  State<CandyPage> createState() => _CandyPageState();
}

class _CandyPageState extends State<CandyPage> {
  int quntity = 0;
  double totalPrice = 0.0;
  CandyModel candy = CandyModel();
  @override
  Widget build(BuildContext context) {
    candy = ModalRoute.of(context)!.settings.arguments as CandyModel;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetCarousel(candy: candy),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomVerticalDivider(10.0),
                Text(
                  candy.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                CustomVerticalDivider(5.0),
                Text(candy.description!),
                CustomVerticalDivider(5.0),
                Text(
                  'R\$ ${Helpers.priceFormatter.format(candy.price)}',
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                CustomVerticalDivider(25.0),
                const Text(
                  'Ingredientes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CustomVerticalDivider(10.0),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: candy.ingredients!.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [Text('- ${candy.ingredients![index]}')],
                      );
                    },
                  ),
                ),
                CustomVerticalDivider(
                    MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () => _decrementQuantity(candy.price!),
                              icon: const Icon(Icons.remove)),
                          Text(quntity.toString()),
                          IconButton(
                              onPressed: () => _incrementQuantity(candy.price!),
                              icon: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            onPressed: quntity == 0
                                ? null
                                : () async {
                                    String path = url(
                                        'Gostaria de encomendar $quntity unidades de ${candy.name}');

                                    try {
                                      final test =
                                          await launchUrl(Uri.parse(path));
                                      print('Funcionou: $test');
                                    } catch (e) {
                                      print('URI not found');
                                    }
                                  },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Solicitar'),
                                Text(
                                    'R\$ ${Helpers.priceFormatter.format(totalPrice)}')
                              ],
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String url(String message) {
    return "https://wa.me/5516992205643?text=${Uri.parse(message)}";
  }

  _incrementQuantity(double price) {
    setState(() {
      quntity++;
      totalPrice = price * quntity;
    });
  }

  _decrementQuantity(double price) {
    if (quntity == 0) return;
    setState(() {
      quntity--;
      totalPrice = price * quntity;
    });
  }
}

class GetCarousel extends StatelessWidget {
  const GetCarousel({
    super.key,
    required this.candy,
  });

  final CandyModel candy;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: candy.images!.length,
      options: CarouselOptions(
        disableCenter: true,
        height: 400,
        padEnds: false,
        viewportFraction: 1,
        enableInfiniteScroll: true,
      ),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Image.asset(
          candy.images![itemIndex],
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        );
      },
    );
  }
}
