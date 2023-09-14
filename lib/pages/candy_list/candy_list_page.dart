import 'package:flutter/material.dart';
import 'package:projeto_doce/models/candy_model.dart';
import 'package:projeto_doce/pages/candy_list/candy_list_strings.dart';
import 'package:projeto_doce/pages/widgets/custom_dividers.dart';
import 'package:projeto_doce/routes/route_strings.dart';
import 'package:projeto_doce/utils/helpers.dart';

class CandyListPage extends StatefulWidget {
  const CandyListPage({super.key});

  @override
  State<CandyListPage> createState() => _CandyListPageState();
}

class _CandyListPageState extends State<CandyListPage> {
  List<CandyModel> candys = [];
  @override
  Widget build(BuildContext context) {
    candys = CandyModel.getCandyList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(CandyListStrings.title),
      ),
      body: ListView.builder(
        itemCount: candys.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _getCandyCard(candy: candys[index]),
          );
        },
      ),
    );
  }

  Widget _getCandyCard({required CandyModel candy}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteStrings.candy, arguments: candy);
      },
      child: SizedBox(
        height: 150,
        child: Card(
          elevation: 2,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 75,
                  height: 150,
                  child: Image.asset(
                    candy.images!.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomHorizontalDivider(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      candy.name!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CustomVerticalDivider(5.0),
                    Text(candy.description!),
                    CustomVerticalDivider(5.0),
                    Text('R\$ ${Helpers.priceFormatter.format(candy.price!)}')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
