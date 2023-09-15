class CandyModel {
  String? name;
  String? description;
  double? price;
  List<String>? images;
  List<String>? ingredients;

  CandyModel(
      {this.name, this.description, this.price, this.images, this.ingredients});

  static List<CandyModel> getCandyList() {
    return [
      CandyModel(
          name: 'Bombom de chocolate',
          description: 'Delicioso bombom trufado sabor chocolate',
          price: 5.00,
          images: [
            'assets/candys/bombom_01.jpg',
            'assets/candys/bombom_02.jpg',
            'assets/candys/bombom_03.jpg',
          ],
          ingredients: [
            'Leite condensado',
            'Margarina aviação',
            'Achocolatado Nescau',
            'Leite condensado',
            'Margarina aviação',
            'Achocolatado Nescau',
          ]),
      CandyModel(
          name: 'Brigadeiro de colher',
          description: 'Delicioso brigadeiro feito com leite moça',
          price: 10.00,
          images: [
            'assets/candys/brigadeiro_01.jpg',
            'assets/candys/brigadeiro_02.jpg',
            'assets/candys/brigadeiro_03.jpg',
          ],
          ingredients: [
            'Leite condensado',
            'Margarina aviação',
            'Achocolatado Nescau',
            'Leite condensado',
            'Margarina aviação',
            'Achocolatado Nescau',
          ]),
      CandyModel(
          name: 'Bolo de pote',
          description:
              'Delicioso bolo feito no pote, de morango com leite ninho',
          price: 15.00,
          images: [
            'assets/candys/bolo_01.jpg',
            'assets/candys/bolo_02.jpg',
            'assets/candys/bolo_03.jpg',
          ],
          ingredients: [
            'Leite condensado',
            'Margarina aviação',
            'Achocolatado Nescau',
            'Leite condensado',
            'Margarina aviação',
            'Achocolatado Nescau',
          ]),
    ];
  }
}
