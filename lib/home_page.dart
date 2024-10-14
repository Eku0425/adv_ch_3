import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Internet connected',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
          ),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.data!.contains(ConnectivityResult.mobile)) {
              return Center(
                child: Container(
                  height: 60,
                  width: 280,
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: const Text(
                      'Mobile connected to internet ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            } else if (snapshot.data!.contains(ConnectivityResult.wifi)) {
              return Center(
                child: Container(
                  height: 50,
                  width: 270,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: const Text(
                    'Mobile Connected to Wi-Fi',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              );
            } else {
              return Center(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 170,
                  ),
                  Image.asset('assets/img/1.png'),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text('Whoops! ',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'Not Internet Connection found',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Check your  Connection or try again',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ));
            }
          },
        ));
  }
}
