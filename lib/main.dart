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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100.0,
            child: ListView.separated(
                padding: const EdgeInsets.all(20.0),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: 100.0,
                  width: 10.0,
                ),
                itemCount: _butterflies.length,
                itemBuilder: _createListViewGestDet
            ),
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

  Widget _createListViewGestDet(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        child: Center(child: Text("\u{1F98B}"+_butterflies[index],
          style: const TextStyle(fontSize: 14.0),),),
        height: 100.0,
        width: 200.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(
            color: index == _selectedIndex
                  ? Colors.lightBlue
                  : Colors.black26,
            width: 3.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
