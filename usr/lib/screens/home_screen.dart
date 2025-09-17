import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/story_model.dart';
import 'package:couldai_user_app/screens/story_screen.dart';
import 'package:couldai_user_app/widgets/story_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Story> stories = [
    Story(
      title: "Sombras do Destino",
      author: "Yuki K.",
      coverImageUrl: "https://picsum.photos/seed/story1/300/400",
      synopsis: "Dois herdeiros de famílias rivais se encontram em um jogo de poder e paixão, onde o ódio pode ser a única coisa que os une.",
      chapters: [
        Chapter(title: "Capítulo 1: O Encontro Inesperado", content: "O conteúdo do capítulo 1 vai aqui..."),
        Chapter(title: "Capítulo 2: Faíscas de Ódio", content: "O conteúdo do capítulo 2 vai aqui..."),
      ],
    ),
    Story(
      title: "Coração de Gelo",
      author: "Aoi M.",
      coverImageUrl: "https://picsum.photos/seed/story2/300/400",
      synopsis: "Um CEO frio e calculista tem seu mundo virado de cabeça para baixo por um novo funcionário ousado que não tem medo de desafiá-lo.",
      chapters: [
        Chapter(title: "Capítulo 1: A Entrevista", content: "Conteúdo do capítulo 1..."),
      ],
    ),
    Story(
      title: "Laços de Vingança",
      author: "Ren T.",
      coverImageUrl: "https://picsum.photos/seed/story3/300/400",
      synopsis: "Ele jurou vingança contra o homem que arruinou sua família, mas não esperava se apaixonar por ele no processo.",
      chapters: [],
    ),
     Story(
      title: "Pacto de Silêncio",
      author: "Haru S.",
      coverImageUrl: "https://picsum.photos/seed/story4/300/400",
      synopsis: "Forçados a um casamento arranjado para selar a paz entre seus clãs, dois inimigos mortais descobrem um desejo proibido.",
      chapters: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Romances Yaoi"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryScreen(story: story),
                ),
              );
            },
            child: StoryCard(story: story),
          );
        },
      ),
    );
  }
}
