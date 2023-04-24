import 'package:corona_api/Model/corona_model.dart';
import 'package:corona_api/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    homeProviderT = Provider.of<HomeProvider>(context, listen: true);
    homeProviderF = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Covid-19"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: homeProviderF!.getCoronaData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  CoronaModel? c1 = snapshot.data;

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black,width: 2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${c1!.statisticTakenAt}",style: GoogleFonts.lato(fontSize: 22),),
                              Text(
                                  "Country Name:${c1.countriesStat[index].countryName}",style: GoogleFonts.lato(
                                fontSize: 18,
                              ),),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Active Cases:${c1.countriesStat[index].activeCases}"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Total Cases:${c1.countriesStat[index].cases}"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Death:${c1.countriesStat[index].deaths}"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "Total Recoverd:${c1.countriesStat[index].totalRecovered}"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "World Total Cases:${c1.worldTotal.totalCases}"),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: c1!.countriesStat.length,
                  );
                }
                return Container(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
