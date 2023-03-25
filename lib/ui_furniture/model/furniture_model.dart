class Furniture {
  Furniture(this.image, this.title, this.price);

  final String image;
  final String title;
  final String price;
}

final furnitureList = <Furniture>[
  Furniture('assets/images/furniture/hemes.png', 'Hemes ArmChair', '126'),
  Furniture('assets/images/furniture/sofa.png', 'Sofar ArmChair', '148'),
  Furniture('assets/images/furniture/wooden.png', 'Wooden ArmChair', '179'),
];
