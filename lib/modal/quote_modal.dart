class QuotesModal {
  late List<Results> results = [];

  QuotesModal({required this.results});

  factory QuotesModal.fromJson(Map m1){
    return QuotesModal(results: (m1['results'] as List).map((e) => Results.fromJson(e),).toList());
  }
}

class Results {
  late String id, author, content, dateAdded, dateModified;
  late List tags;

  Results({
    required this.id,
    required this.author,
    required this.content,
    required this.dateAdded,
    required this.dateModified,
    required this.tags,
  });

  factory Results.fromJson(Map m1) {
    return Results(
      id: m1['_id'] ?? '',
      author: m1['author'],
      content: m1['content'],
      dateAdded: m1['dateAdded'],
      dateModified: m1['dateModified'],
      tags: m1['tags'] ?? '',
    );
  }
}
