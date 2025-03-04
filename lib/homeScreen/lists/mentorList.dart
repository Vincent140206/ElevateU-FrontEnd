class MentorList {
  final String imagePath;
  final String name;

  MentorList({
    required this.name,
    required this.imagePath,
  });
}

List<MentorList> mentorList = [
  MentorList(
      name: 'Fanny',
      imagePath: 'assets/images/Fanny.png'
  ),
  MentorList(
      name: 'Melanie',
      imagePath: 'assets/images/Melanie.png'
  ),
  MentorList(
      name: 'Christ',
      imagePath: 'assets/images/Christ.png'
  ),
  MentorList(
      name: 'Yoseph',
      imagePath: 'assets/images/Yoseph.png'
  ),
  MentorList(
      name: 'John',
      imagePath: 'assets/images/John.png'
  ),
];