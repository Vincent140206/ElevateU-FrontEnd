class MentorList {
  final String imagePath;
  final String name;
  final String speciality;
  final String review;
  final String price;
  final String challenge;

  MentorList({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.review,
    required this.speciality,
    required this.challenge
  });
}

List<MentorList> mentorList = [
  MentorList(
    name: 'Fanny',
    imagePath: 'assets/images/Fanny.png',
    speciality: 'UX Designer',
    price: 'Rp 216.000',
    review: '4.8/5 (124 Review)',
    challenge: '2rb Challenge'
  ),
  MentorList(
      name: 'Melanie',
      imagePath: 'assets/images/Melanie.png',
      speciality: 'Digital Marketing',
      price: 'Rp 216.000',
      review: '4.8/5 (124 Review)',
      challenge: '2rb Challenge'
  ),
  MentorList(
      name: 'Christ',
      imagePath: 'assets/images/Christ.png',
      speciality: 'Cybersecurity',
      price: 'Rp 216.000',
      review: '4.8/5 (124 Review)',
      challenge: '2rb Challenge'
  ),
  MentorList(
      name: 'Yoseph',
      imagePath: 'assets/images/Yoseph.png',
      speciality: 'Bussiness Analyst',
      price: 'Rp 216.000',
      review: '4.8/5 (124 Review)',
      challenge: '2rb Challenge'
  ),
  MentorList(
      name: 'John',
      imagePath: 'assets/images/John.png',
      speciality: 'Front-End Developer',
      price: 'Rp 216.000',
      review: '4.8/5 (124 Review)',
      challenge: '2rb Challenge'
  ),
];