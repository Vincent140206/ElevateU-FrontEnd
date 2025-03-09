class CourseList {
  final String title;
  final String imagePath;
  final String materi;
  final String durasi;

  CourseList({
    required this.title,
    required this.imagePath,
    required this.materi,
    required this.durasi
});
}

List<CourseList> courselist = [
  CourseList(
      title: 'Fundamental UX Designer',
      imagePath: 'assets/images/SB1.png',
      materi: '12 Materi',
      durasi: '3 hrs 30 mins'
  ),
  CourseList(
      title: 'Front-End Developer',
      imagePath: 'assets/images/Rekomendasi3.png',
      materi: '12 Materi',
      durasi: '3 hrs 30 mins'
  ),
  CourseList(
      title: 'Web Development Series',
      imagePath: 'assets/images/Rekomendasi1.png',
      materi: '12 Materi',
      durasi: '3 hrs 30 mins'
  ),
  CourseList(
      title: 'Front-End Developer',
      imagePath: 'assets/images/Rekomendasi3.png',
      materi: '12 Materi',
      durasi: '3 hrs 30 mins'
  ),CourseList(
      title: 'Data Analyst',
      imagePath: 'assets/images/SB2.png',
      materi: '12 Materi',
      durasi: '3 hrs 30 mins'
  ),
  CourseList(
      title: 'Product Manager',
      imagePath: 'assets/images/Rekomendasi2.png',
      materi: '12 Materi',
      durasi: '3 hrs 30 mins'
  ),
];
