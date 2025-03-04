class RekomendasiList {
  final String imagePath;
  final String mentorImagePath;
  final String title;
  final String name;
  final String review;

  RekomendasiList({
    required this.imagePath,
    required this.mentorImagePath,
    required this.title,
    required this.name,
    required this.review,
  });
}

List<RekomendasiList> rekList = [
  RekomendasiList(
      imagePath: 'assets/images/Rekomendasi1.png',
      mentorImagePath: 'assets/images/Christ.png',
      title: 'Web Development Series',
      name: 'Christiano Ronald S.Kom',
      review: '4.8/5 (124 Review)'
  ),
  RekomendasiList(
      imagePath: 'assets/images/Rekomendasi2.png',
      mentorImagePath: 'assets/images/Melanie.png',
      title: 'Social Media Strategy',
      name: 'Melanie Putrie S.I',
      review: '4.8/5 (124 Review)'
  ),
  RekomendasiList(
      imagePath: 'assets/images/Rekomendasi3.png',
      mentorImagePath: 'assets/images/John.png',
      title: 'Front-End Developer',
      name: 'John Lewis B.Cs',
      review: '4.8/5 (124 Review)'
  ),
];