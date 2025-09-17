class Chapter {
  final String title;
  final String content;

  Chapter({required this.title, required this.content});
}

class Story {
  final String title;
  final String author;
  final String coverImageUrl;
  final String synopsis;
  final List<Chapter> chapters;

  Story({
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.synopsis,
    required this.chapters,
  });
}
