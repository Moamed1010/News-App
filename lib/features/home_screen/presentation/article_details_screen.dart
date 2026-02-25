import 'package:flutter/material.dart';
import 'package:news_app/features/home_screen/domain/entity/article_entity.dart';


class ArticleDetailsScreen extends StatelessWidget {
  final ArticleEntity article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.source?.name ?? 'News Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
       
            if (article.urlToImage != null) Image.network(article.urlToImage!),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'By ${article.author ?? "Unknown"} • ${article.publishedAt?.toLocal()}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    article.description ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    article.content ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
