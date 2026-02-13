enum FromWho { me, her }

class Message {
  final String text;
  final FromWho fromWho;
  final String? imageUrl;
  final DateTime createdAt;

  Message({
    required this.text,
    required this.fromWho,
    this.imageUrl,
    required this.createdAt,
  });
}
