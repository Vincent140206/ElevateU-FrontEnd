class KategoriList {
  final String iconPath;
  final String name;

  KategoriList({
    required this.name,
    required this.iconPath,
  });
}

List<KategoriList> kategoriList= [
  KategoriList(
    name: 'Programmer',
      iconPath: 'assets/icons/Programmer.png',
  ),
  KategoriList(
    name: 'Marketing',
    iconPath: 'assets/icons/Marketing.png',
  ),
  KategoriList(
    name: 'Science',
    iconPath: 'assets/icons/Science.png',
  ),
  KategoriList(
    name: 'Business',
    iconPath: 'assets/icons/Business.png',
  ),
];