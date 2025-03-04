class sbList {
  final String title;
  final String materi;
  final String review;
  final String imagePath;

  sbList({
    required this.title,
    required this.materi,
    required this.review,
    required this.imagePath,
  });
}

List<sbList> skillBoostList = [
  sbList(
      title: 'Fundamental UX Designer',
      materi: '12 Materi',
      review: '(4.5) 210 Review',
      imagePath: 'assets/images/SB1.png'
  ),
  sbList(
      title: 'Data Analyst Foundation',
      materi: '12 Materi',
      review: '(4.5) 210 Review',
      imagePath: 'assets/images/SB2.png'
  ),
  sbList(
      title: 'Cyber Security Fundamental',
      materi: '12 Materi',
      review: '(4.5) 210 Review',
      imagePath: 'assets/images/SB3.jpeg'
  ),
];