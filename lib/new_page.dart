import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  var _sonuc = null;
  var _carpmaSonuc = null;

  @override
  void initState() {
    super.initState();
    restApiToplaCalistir(5, 10.7);
    restApiCarpCalistir([2, 5, 6]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Made By Levent Ergören"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: _sonuc == null && _carpmaSonuc == null
            ? Text("")
            : Text(
                'Toplama Sonucu: ' +
                    _sonuc!.toString() +
                    '\nÇarpma Sonucu: ' +
                    _carpmaSonuc.toString(),
                style: TextStyle(fontSize: 20),
              ),
      ),
    );
  }

  restApiToplaCalistir(var sayi1, var sayi2) async {
    final Dio _dio = Dio();
    final url = 'http://10.0.2.2:13/api/add-two?num1=$sayi1&num2=$sayi2';
    try {
      final response = await _dio.get(url);
      _sonuc = response.data['result'];
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  restApiCarpCalistir(List<num> liste) async {
    final Dio _dio = Dio();
    final url = 'http://10.0.2.2:13/api/multiply';

    try {
      final response = await _dio.post(
        url,
        data: {'numbers': liste},
      );

      setState(() {
        _carpmaSonuc = response.data['result'];
      });
    } catch (e) {
      print(e);
    }
  }
}
