class Info {
  final String imageUrl;
  final String name;
  final String category;
  final String description;
  final String description1;
  final String description2;
  final String description3;



  Info({
    this.imageUrl,
    this.name,
    this.category,
    this.description,
    this.description1,
    this.description2,
    this.description3,
  });
}

final List<Info> infos = [
  Info(
    imageUrl: 'assets/images/info0.png',
    name: 'Symptoms',
    category: 'Covid-19',

    description: 'Dry Cough.',
    description1: 'High Fever.',
    description2: 'Soar Throat.',
    description3: 'Difficulty in Breathing.',
  ),
  Info(
    imageUrl: 'assets/images/info1.png',
    name: 'Prevention Tips',
    category: 'Covid-19',
    description: 'Wash Your Hands Often.',
    description1: 'Avoid Crowded Places.',
    description2: 'Wera a Face Mask.',
    description3: 'Always Cover your Cough or Sneeze.',
  ),
  Info(
    imageUrl: 'assets/images/info2.png',
    name: 'How it spreads ?',
    category: 'Covid-19',

    description: 'Personal Contact.',
    description1: 'Crowd Gathering.',
    description2: 'Air by Cough or Sneeze..',
    description3: 'Contaminated Objects.',
  ),
];
