class FurnitureModel {
  final String image;
  final String title;
  final String price;

  FurnitureModel(this.image, this.title, this.price);
}

List<FurnitureModel> furnitureList = <FurnitureModel>[
  FurnitureModel('assets/images/furniture/hemes.png', 'Hemes ArmChair', '126'),
  FurnitureModel('assets/images/furniture/sofa.png', 'Sofar ArmChair', '148'),
  FurnitureModel('assets/images/furniture/wooden.png', 'Wooden ArmChair', '179'),
];
