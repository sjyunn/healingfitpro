import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  String stateText = 'Connecting';
  String connectButtonText = 'Disconnect';
  BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;
  StreamSubscription<BluetoothDeviceState>? _stateListener;
  List<BluetoothService> bluetoothService = [];

  Map<String, List<int>> notifyDatas = {};

  @override
  void initState() {
    super.initState();
    _stateListener = widget.device.state.listen((event) {
      debugPrint('event : $event');
      if (deviceState == event) {
        return;
      }
      setBleConnectionState(event);
    });
    connect();
  }

  @override
  void dispose() {
    _stateListener?.cancel();
    disconnect();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  setBleConnectionState(BluetoothDeviceState event) {
    switch (event) {
      case BluetoothDeviceState.disconnected:
        stateText = 'Disconnected';
        connectButtonText = 'Connect';
        break;
      case BluetoothDeviceState.disconnecting:
        stateText = 'Disconnecting';
        break;
      case BluetoothDeviceState.connected:
        stateText = 'Connected';
        break;
      case BluetoothDeviceState.connecting:
        stateText = 'Connecting';
        break;
    }
    deviceState = event;
    setState(() {});
  }

  Future<bool> connect() async {
    Future<bool>? returnValue;
    setState(() {
      stateText = 'Connecting';
    });

    await widget.device
        .connect(autoConnect: false)
        .timeout(const Duration(milliseconds: 15000), onTimeout: () {
      returnValue = Future.value(false);
      debugPrint('timeout failed');
      setBleConnectionState(BluetoothDeviceState.disconnected);
    }).then((data) async {
      bluetoothService.clear();
      if (returnValue == null) {
        debugPrint('connection successful');
        print('start discover service');
        List<BluetoothService> bleServices =
            await widget.device.discoverServices();
        setState(() {
          bluetoothService = bleServices;
        });
        for (BluetoothService service in bleServices) {
          print("====================================");
          print("Service UUID: ${service.uuid}");
          for (BluetoothCharacteristic c in service.characteristics) {
            print('\tcharacteristic UUID: ${c.uuid.toString()}');
            print('\t\twrite: ${c.properties.write}');
            print('\t\tread: ${c.properties.read}');
            print('\t\tnotify: ${c.properties.notify}');
            print('\t\tisNotifying: ${c.isNotifying}');
            print(
                '\t\twriteWithoutResponse: ${c.properties.writeWithoutResponse}');
            print('\t\tindicate: ${c.properties.indicate}');

            if (c.properties.notify && c.descriptors.isNotEmpty) {
              for (BluetoothDescriptor d in c.descriptors) {
                print('BluetoothDescriptor uuid ${d.uuid}');
                if (d.uuid == BluetoothDescriptor.cccd) {
                  print('d.lastValue: ${d.lastValue}');
                }
              }

              if (!c.isNotifying) {
                try {
                  await c.setNotifyValue(true);
                  notifyDatas[c.uuid.toString()] = List.empty();
                  c.value.listen((value) {
                    print('${c.uuid}: $value');
                    setState(() {
                      notifyDatas[c.uuid.toString()] = value;
                    });
                  });

                  await Future.delayed(const Duration(milliseconds: 500));
                } catch (e) {
                  print('error ${c.uuid} $e');
                }
              }
            }
          }
        }
        returnValue = Future.value(true);
      }
    });

    return returnValue ?? Future.value(false);
  }

  void disconnect() {
    try {
      setState(() {
        stateText = 'Disconnection';
      });
      widget.device.disconnect();
    } catch (e) {
      debugPrint('event : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text(widget.device.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(stateText),
                OutlinedButton(
                    onPressed: () {
                      if (deviceState == BluetoothDeviceState.connected) {
                        disconnect();
                      } else if (deviceState ==
                          BluetoothDeviceState.disconnected) {
                        // connect();
                      }
                    },
                    child: Text(connectButtonText)),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: bluetoothService.length,
                itemBuilder: (context, index) {
                  return listItem(bluetoothService[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget characteristicInfo(BluetoothService r) {
    String name = '';
    String properties = '';
    String data = '';

    for (BluetoothCharacteristic c in r.characteristics) {
      properties = '';
      data = '';
      name += 't\t${c.uuid}\n';
      if (c.properties.write) {
        properties += 'Write';
      }
      if (c.properties.read) {
        properties += 'Read';
      }
      if (c.properties.notify) {
        properties += 'Notify';
        if (notifyDatas.containsKey(c.uuid.toString())) {
          if (notifyDatas[c.uuid.toString()]!.isNotEmpty) {
            data = notifyDatas[c.uuid.toString()].toString();
          }
        }
      }
      if (c.properties.writeWithoutResponse) {
        properties += 'WriteWR';
      }
      if (c.properties.indicate) {
        properties += 'Indicate';
      }
      name += 't\t\tProperties: $properties\n';
      if (data.isNotEmpty) {
        name = '\t\t\t\t$data\n';
      }
    }
    return Text(name);
  }

  Widget serviceUUID(BluetoothService r) {
    String name = '';
    name = r.uuid.toString();
    return Text(name);
  }

  Widget listItem(BluetoothService r) {
    return ListTile(
      onTap: null,
      title: serviceUUID(r),
      subtitle: characteristicInfo(r),
    );
  }
}
