class SkillUpgradeList {
  final String imagePath;
  final String title;
  final String tanggal;

  SkillUpgradeList({
    required this.title,
    required this.imagePath,
    required this.tanggal
  });
}

List<SkillUpgradeList> suList= [
  SkillUpgradeList(
    title: 'Future-Proof Your Career: Skill yang Dibutuhkan di 2025',
    imagePath: 'assets/images/SU1.png',
    tanggal: 'Hari Ini',
  ),
  SkillUpgradeList(
    title: 'Hard vs Soft Skills: Mana yang Lebih Penting di Dunia Kerja?',
    imagePath: 'assets/images/SU2.jpeg',
    tanggal: '23 Maret',
  ),
];