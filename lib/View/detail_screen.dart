import 'package:covid_tracker/View/Worldstates.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String todaycases;
  String death;
  String todaydeath;
  String recovered;
  String todayrecovered;
  String active;
  String critical;
  String flag;

  DetailScreen(
      {Key? key,
      required this.name,
      required this.todaycases,
      required this.death,
      required,
      required this.todaydeath,
      required this.recovered,
      required this.todayrecovered,
      required this.active,
      required this.critical,
      required this.flag,})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Container(
            height: 120,
            width: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(widget.flag) ,fit: BoxFit.cover)
            ),
          ),
          SizedBox(height: 10,),
          Card(
            child: Column(
              children: [
                ReusableRow(title: 'Name', value: widget.name),
                ReusableRow(title: 'Today Cases', value: widget.todaycases),
                ReusableRow(title: 'Death', value: widget.death),
                ReusableRow(title: 'Today Death', value: widget.todaydeath),
                ReusableRow(title: 'Recovered', value: widget.recovered),
                ReusableRow(
                    title: 'Today Recovery', value: widget.todayrecovered),
                ReusableRow(title: 'Active', value: widget.active),
                ReusableRow(title: 'Critical', value: widget.critical)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
