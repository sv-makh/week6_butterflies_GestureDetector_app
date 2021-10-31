import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Бабочки"),
          centerTitle: true,
        ),
        body: ButterfliesList(),
      )));
}

class ButterfliesList extends StatefulWidget {
  @override
  _ButterfliesListState createState() => _ButterfliesListState();
}

class _ButterfliesListState extends State<ButterfliesList> {
  final List<String> _butterflies = [
    "Аполлон",
    "Павлиноглазка Артемида",
    "Павлиний глаз",
    "Адмирал",
    "Носатка листовидная",
    "Ornithoptera akakeae",
    "Махаон",
    "Мешочницы",
    "Слава Бутана",
    "Морфо Гекуба",
    "Morpho aurora",
    "Морфо киприда"
  ];
  final List<String> _butterfliesDescription = [
    "Видовое название дано в честь Аполлона (греческая мифология) — сына Зевса и Лето, брата Артемиды, божества красоты и света.",
    "Видовое название дано в честь Артемиды — в греческой мифологии девственная, всегда юная богиня охоты, богиня плодородия, богиня женского целомудрия, покровительница всего живого на Земле.",
    "Латинское биноминальное название происходит от Īnachis — царя Инаха и его дочери Ио в древнегреческой мифологии.",
    "Русское название «адмирал» возникло из-за сходства окраски крыльев бабочки и лампасов на брюках адмирала флота Российской империи",
    "Русское родовое название дано из-за того, что вид характеризуются длинными губными щупиками.",
    "Название дано в честь цветущего жёлтыми цветками растения из рода Акация — Acacia dealbata",
    "Махаон назван шведским натуралистом Карлом Линнеем в честь персонажа греческой мифологии врача Махаона, по преданиям являвшегося сыном Асклепия и Эпионы и принимавшего участие в походе греков на Трою во время Троянской войны (1194—1184 до н. э.)",
    "Отличительной особенностью представителей семейства является сооружение гусеницами чехликов из сплетённых шелковинкой частиц листьев, коры, веточек и комочков почвы — откуда и произошло русское название семейства.",
    "Название рода указывает на страну Бутан, где впервые и был найден данный вид",
    "Видовое название Гекуба дано в честь жены троянского царя Приама, на долю которой выпала трагическая судьба и которая прославилась своей местью",
    "Видовое название Аврора дано в честь Авроры богини зари римской мифологии.",
    "Название бабочки связано с именем древнегреческой богини Афродиты. Считается, что Афродита возникла обнаженной из воздушной морской раковины вблизи Кипра — отсюда прозвище «Киприда» — и на раковине добралась до берега."
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100.0,
            child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                scrollDirection: Axis.horizontal,
                //ширина элемента списка
                itemExtent: 200.0,
                itemCount: _butterflies.length,
                itemBuilder: ((BuildContext context, int index) {
                  return ListTile(
                    //уменьшить расстояние между title и leading
                    title: Transform.translate(
                      child: Text(
                        _butterflies[index],
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      offset: const Offset(-15, 0),
                    ),
                    //unicode бабочка
                    leading: const Text(
                      "\u{1F98B}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                          width: 3.0,
                          //у выбранного элемента цвет границы lightBlue, у остальных black26
                          color: index == _selectedIndex
                              ? Colors.lightBlue
                              : Colors.black26),
                    ),
                    tileColor: Colors.black12,
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );
                })),
          ),
          //пространство между списком бабочек и описанием
          const SizedBox(height: 50),
          SingleChildScrollView(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Text(
              _selectedIndex == -1
                  ? ""
                  : _butterfliesDescription[_selectedIndex],
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ]);
  }
}
