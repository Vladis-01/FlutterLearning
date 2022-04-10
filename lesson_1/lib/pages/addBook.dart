import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lesson_1/film.dart';

class AddBook extends StatefulWidget {
  final int id;

  const AddBook({Key? key, required this.id}) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState(id);
}

class _AddBookState extends State<AddBook> {
  final _idController = TextEditingController();
  final _titleController = TextEditingController();
  final _pictureController = TextEditingController();
  final _voteAverageController = TextEditingController();
  final _releaseDateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _languageController = TextEditingController();

  int id;
  _AddBookState(int this.id);


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add film"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: SafeArea(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            SizedBox(
                width: 200,
                height: 40,
                child: TextField(
                    controller: _titleController,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Title",
                    )),

            ),
             Padding(padding: EdgeInsets.only(top: 10)),
             SizedBox(
              width: 200,
               height: 40,
              child: TextField(

                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: _pictureController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Picture",
                  )),

            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            SizedBox(
              width: 200,
              height: 40,
              child: TextField(

                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: _voteAverageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Vote average",
                  )),

            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            SizedBox(
              width: 200,
              height: 40,
              child: TextField(

                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: _releaseDateController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Release date",
                  )),

            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            SizedBox(
              width: 200,
              child: TextFormField(

                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Description",
                  )),

            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            SizedBox(
              width: 200,
              height: 40,
              child: TextField(

                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: _languageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Language",
                  )),

            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ElevatedButton(
                child: Text("Add"),
                onPressed: () {
                  double voteAverage = double.tryParse(_voteAverageController.text) ?? -1;
                  Film film = Film(id: id.toString(), title: _titleController.text, picture: _pictureController.text,
                      voteAverage: voteAverage, releaseDate: _releaseDateController.text,
                      description: _descriptionController.text, language: _languageController.text);
                  Navigator.pop(context, film);
                }),
          ])
        ])));
  }
}
