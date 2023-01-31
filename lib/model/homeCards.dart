class MyCards {
  String? title;
  String? image;

  MyCards({
    this.title,
    this.image,
  });
}

List<MyCards> homeCards = [
  MyCards(
    title: "Conference",
    image: "assets/conference.jpg",
  ),
  MyCards(title: "Awards Night", image: "assets/award-night.jpg"),
  MyCards(title: "Exhibition", image: "assets/exhibition.jpg"),
  MyCards(title: "Gala Event", image: "assets/gala-event.jpg"),
  MyCards(title: "Confirm/Expo", image: "assets/Expo.jpg"),
  MyCards(title: "Wedding", image: "assets/wedding.jpg"),
  MyCards(title: "Corporate Event ", image: "assets/corporate.jpg"),
  MyCards(title: "Private", image: "assets/private-event.jpg"),
];
