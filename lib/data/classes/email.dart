class EmailItem {
  final String title, description, avatar;
  final DateTime date;
  bool favorite = false;

  EmailItem(
      {this.title, this.description, this.date, this.avatar, this.favorite});
}
