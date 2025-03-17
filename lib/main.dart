import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IoT Device Control',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DeviceInfoPage(),
    );
  }
}

// Halaman Informasi Perangkat (StatelessWidget)
class DeviceInfoPage extends StatelessWidget {
  const DeviceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informasi Perangkat')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('📌 Perangkat: Smart Lamp', style: TextStyle(fontSize: 20)),
            Text(
              '✅ Status: Online',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            Text('📡 IP Address: 192.168.1.10', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeviceControlPage()),
                );
              },
              child: Text('Buka Kontrol'),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Kontrol Perangkat (StatefulWidget)
class DeviceControlPage extends StatefulWidget {
  const DeviceControlPage({super.key});

  @override
  _DeviceControlPageState createState() => _DeviceControlPageState();
}

class _DeviceControlPageState extends State<DeviceControlPage> {
  bool isLampOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kontrol Perangkat')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('💡 Smart Lamp', style: TextStyle(fontSize: 22)),
            Text(
              isLampOn ? '✅ Status: Menyala' : '❌ Status: Mati',
              style: TextStyle(
                fontSize: 18,
                color: isLampOn ? Colors.green : Colors.red,
              ),
            ),
            Switch(
              value: isLampOn,
              onChanged: (value) {
                setState(() {
                  isLampOn = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
