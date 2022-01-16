import 'package:flutter/material.dart';
import 'package:city_picker_from_map/city_picker_from_map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyApp2(),
      theme: ThemeData.light(),
    );
  }
}


class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries Maps"),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Center(
          child: ListView(

            padding: EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 20),
            children: [
              buildElevatedButton(context , "EGYPT" , Maps.EGYPT),
              SizedBox(height: 10,),
              buildElevatedButton(context , "FRANCE" , Maps.FRANCE),
              SizedBox(height: 10,),
              buildElevatedButton(context , "UNITED_ARAB_EMIRATES" , Maps.UNITED_ARAB_EMIRATES),
              SizedBox(height: 10,),
              buildElevatedButton(context , "USA" , Maps.USA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "TURKEY" , Maps.TURKEY),
              SizedBox(height: 10,),
              buildElevatedButton(context , "QATAR" , Maps.QATAR),
              SizedBox(height: 10,),
              buildElevatedButton(context , "SAUDI_ARABIA" , Maps.SAUDI_ARABIA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "ALGERIA" , Maps.ALGERIA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "ALBANIA" , Maps.ALBANIA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "MALAYSIA" , Maps.MALAYSIA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "GERMANY" , Maps.GERMANY),
              SizedBox(height: 10,),
              buildElevatedButton(context , "AFGHANISTAN" , Maps.AFGHANISTAN),
              SizedBox(height: 10,),
              buildElevatedButton(context , "UNITED_ARAB_EMIRATES" , Maps.UNITED_ARAB_EMIRATES),
              SizedBox(height: 10,),
              buildElevatedButton(context , "USA" , Maps.USA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "TURKEY" , Maps.TURKEY),
              SizedBox(height: 10,),
              buildElevatedButton(context , "QATAR" , Maps.QATAR),
              SizedBox(height: 10,),
              buildElevatedButton(context , "SAUDI_ARABIA" , Maps.SAUDI_ARABIA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "ALGERIA" , Maps.ALGERIA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "ALBANIA" , Maps.ALBANIA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "MALAYSIA" , Maps.MALAYSIA),
              SizedBox(height: 10,),
              buildElevatedButton(context , "GERMANY" , Maps.GERMANY),
              SizedBox(height: 10,),
              buildElevatedButton(context , "AFGHANISTAN" , Maps.AFGHANISTAN),
              SizedBox(height: 10,),

            ],
          ),
        )
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context , String title ,String map ) {
    return ElevatedButton(

              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Country(map)));
              },
              child: Padding( padding: EdgeInsets.only(top: 20,bottom: 20),child: Text(title)),
      style: ElevatedButton.styleFrom(primary: Colors.indigoAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            );
  }
}



class Country extends StatefulWidget {
  Country(this.map);
    String map  ;
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  City? selectedCity;
  final GlobalKey<CityPickerMapState> _mapKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected City: ${selectedCity?.title ?? '(?)'}'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _mapKey.currentState?.clearSelect();
                setState(() {
                  selectedCity = null;
                });
              })
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin:EdgeInsets.all(0) ,
          scaleEnabled: true,
          panEnabled: true,
          constrained: true,
          child: Center(
            child: CityPickerMap(
              key: _mapKey,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              map:  widget.map,

              onChanged: (city) {
                setState(() {
                  selectedCity = city;
                });
              },
              actAsToggle: true,
              dotColor: Colors.white,
              selectedColor: Colors.lightBlueAccent,
              strokeColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
