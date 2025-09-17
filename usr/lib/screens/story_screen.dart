import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/story_model.dart';

class StoryScreen extends StatelessWidget {
  final Story story;

  const StoryScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                story.title,
                style: const TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              background: Image.network(
                story.coverImageUrl,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Por ${story.author}",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Sinopse",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    story.synopsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Capítulos",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(thickness: 1),
                ],
              ),
            ),
          ),
          story.chapters.isEmpty
              ? const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    child: Center(
                      child: Text("Nenhum capítulo disponível ainda."),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final chapter = story.chapters[index];
                      return ListTile(
                        leading: Text("${index + 1}"),
                        title: Text(chapter.title),
                        onTap: () {
                          // TODO: Navegar para a tela de leitura do capítulo
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Lendo: ${chapter.title}")),
                          );
                        },
                      );
                    },
                    childCount: story.chapters.length,
                  ),
                ),
        ],
      ),
    );
  }
}
