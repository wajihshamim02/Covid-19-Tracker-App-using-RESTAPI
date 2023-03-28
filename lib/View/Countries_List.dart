import 'package:covid_tracker/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Services/Utilities/states_services.dart';

class CountriesList extends StatefulWidget {
  CountriesList({Key? key}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesservices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchcontroller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 18),
                // contentPadding: EdgeInsets.all(10),
                hintText: 'Search for country name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: statesservices.CountriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor:
                                    Color.fromARGB(255, 124, 124, 124),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.grey,
                                      ),
                                      title: Container(
                                        height: 10,
                                        width: 80,
                                        color: Colors.grey,
                                      ),
                                      subtitle: Container(
                                        height: 10,
                                        width: 80,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ));
                          }));
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            String name = snapshot.data![index]['country'];

                            if (searchcontroller.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => DetailScreen(
                                                  name: snapshot.data![index]
                                                      ['country'],
                                                  todaycases: snapshot.data![index]
                                                          ['todayCases']
                                                      .toString(),
                                                  death: snapshot.data![index]['deaths']
                                                      .toString(),
                                                  todaydeath: snapshot.data![index]
                                                          ['todayDeaths']
                                                      .toString(),
                                                  recovered: snapshot
                                                      .data![index]['recovered']
                                                      .toString(),
                                                  todayrecovered: snapshot
                                                      .data![index]['todayRecovered']
                                                      .toString(), 
                                                      active: snapshot.data![index]
                                                          ['active'].toString(),
                                                      critical: snapshot.data![index]
                                                          ['critical'].toString(), 
                                                          flag: snapshot.data![index]['countryInfo']
                                                ['flag'],))));
                                    },
                                    child: ListTile(
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text('Cases: ' +
                                          snapshot.data![index]['cases']
                                              .toString()),
                                    ),
                                  ),
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchcontroller.text.toLowerCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                     onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => DetailScreen(
                                                  name: snapshot.data![index]
                                                      ['country'],
                                                  todaycases: snapshot.data![index]
                                                          ['todayCases']
                                                      .toString(),
                                                  death: snapshot.data![index]['deaths']
                                                      .toString(),
                                                  todaydeath: snapshot.data![index]
                                                          ['todayDeaths']
                                                      .toString(),
                                                  recovered: snapshot
                                                      .data![index]['recovered']
                                                      .toString(),
                                                  todayrecovered: snapshot
                                                      .data![index]['todayRecovered']
                                                      .toString(), 
                                                      active: snapshot.data![index]
                                                          ['active'].toString(), 
                                                          critical: snapshot.data![index]
                                                          ['critical'].toString(), 
                                                          flag: snapshot.data![index]['countryInfo']
                                                ['flag']))));
                                    },
                                    child: ListTile(
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text('Cases: ' +
                                          snapshot.data![index]['cases']
                                              .toString()),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }));
                    }
                  }))
        ],
      ),
    );
  }
}
