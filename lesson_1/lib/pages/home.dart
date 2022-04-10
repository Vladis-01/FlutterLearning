import 'package:flutter/material.dart';
import 'package:lesson_1/film.dart';
import 'package:lesson_1/pages/addBook.dart';

import '../films.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Films films = Films();
  int id = 2;
  List<Film> allFilms = [
    Film(
        id: "0",
        title: "Мумия",
        picture: "Боевик",
        voteAverage: 5,
        releaseDate: "2017",
        description:
            "Американский приключенческий фильм сценариста и режиссёра Стивена Соммерса.",
        language: "Английский"),
    Film(
        id: "1",
        title: "Человек-паук",
        picture: "Научная фантастика",
        voteAverage: 4.5,
        releaseDate: "2002",
        description:
            "Вымышленный персонаж комиксов Marvel, созданный Стэном Ли и Стивом Дитко, который появлялся в качестве главного героя во многих фильмах и сериалах..",
        language: "Английский"),
    Film(
        id: "2",
        title: "Брат",
        picture: "Научная фантастика",
        voteAverage: 5,
        releaseDate: "1997",
        description:
            "Демобилизовавшись, Данила Багров вернулся в родной городок. Но скучная жизнь российской провинции не устраивала его, и он решился податься в Петербург, где, по слухам, уже несколько лет процветает его старший брат.",
        language: "Русский")
  ];

  List<Film> currentFilms = [];

  @override
  void initState() {
    currentFilms = List<Film>.from(allFilms);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Films list"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SafeArea(
          child: Column(children: [
        SizedBox(
            height: 400,
            child: ListView.builder(
                itemCount: currentFilms.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(currentFilms[index].toString()),
                    child: Card(
                      color: Colors.deepOrangeAccent,
                      borderOnForeground: true,
                      child: ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      "Фильм ${currentFilms[index].title}"),
                                  content: Text(
                                      "Фильм: ${currentFilms[index].title} \n"
                                      "Жанр: ${currentFilms[index].picture} \n"
                                      "Год релиза: ${currentFilms[index].releaseDate} \n"
                                      "Оценка: ${currentFilms[index].voteAverage} \n"
                                      "Язык: ${currentFilms[index].language} \n"
                                      "Описание: ${currentFilms[index].description} \n"),
                                );
                              });
                        },
                        title: Text(currentFilms[index].toString()),
                        trailing: const Icon(Icons.tv),
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        allFilms.remove(currentFilms[index]);
                        currentFilms.removeAt(index);
                      });
                    },
                  );
                })),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrangeAccent,
            ),
            child: Text("Add film", style: TextStyle(fontSize: 22)),
            onPressed: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBook(
                      id: ++id,
                    ),
                  ));

              setState(() {
                if (result != null && result != "") allFilms.add(result);
              });
            }),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrangeAccent,
            ),
            child: const Text("Filter", style: TextStyle(fontSize: 22)),
            onPressed: () async {
              Film result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddBook(
                      id: -1,
                    ),
                  ));

              setState(() {
                currentFilms =
                    List<Film>.from(films.filter(result, currentFilms));
              });
            }),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrangeAccent,
            ),
            child: const Text("All films", style: TextStyle(fontSize: 22)),
            onPressed: () {
              setState(() {
                currentFilms = List<Film>.from(allFilms);
              });
            }),
      ])),
    );
  }
}
