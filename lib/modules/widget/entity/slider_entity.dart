class SliderData {
  final String? titleText;
  final String? subText;
  final String? assetsImage;

  SliderData({this.titleText, this.subText, this.assetsImage});

  static List<SliderData> introSliderData = [
    SliderData(
      titleText: 'Plan for your holiday',
      subText: 'book in your unique hotel to\nescape the ordinary',
      assetsImage: ('assets/images/introduction1-removebg-preview.png'),
    ),
    SliderData(
      titleText: 'Get a car park',
      subText:
          'Book in our parking lot to \nget rid of traffic problems',
      assetsImage: 'assets/images/introduction3-removebg-preview.png',
    ),
    SliderData(
      titleText: 'Choose your favorite room',
      subText:
          'Find your comfort in any\n room you prefer',
      assetsImage: 'assets/images/introduction7-removebg-preview.png',
    )
  ];

  static List<SliderData> exploreSliderData = [
    SliderData(
      titleText: 'Cape Town',
      subText: 'Extraordinary five-star\noutdoor activites',
      assetsImage: 'assets/images/explore_2.jpg',
    ),
    SliderData(
      titleText: 'Find best deals',
      subText: 'Extraordinary five-star\noutdoor activites',
      assetsImage: 'assets/images/explore_1.jpg',
    ),
    SliderData(
      titleText: 'Find best deals',
      subText: 'Extraordinary five-star\noutdoor activites',
      assetsImage: 'assets/images/explore_3.jpg',
    )
  ];
}
