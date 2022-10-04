
import 'package:flutter/cupertino.dart';
import 'package:temperature_monitor/models/average_temp_model.dart';
import 'package:temperature_sensor/temperature_sensor.dart';
import 'package:temperature_sensor/util/models/sensor_model.dart';

class SensorController extends ChangeNotifier{

  SensorController() {
    _startReadingData();
  }

  TemperatureSensor temperatureSensor = TemperatureSensor();
  late Stream sensorStream;
  AverageTempModel averageTempSensor = AverageTempModel(name: 'Average CPU Temperature');

  void _startReadingData() {
    sensorStream = temperatureSensor.startReadingSensorData();
    sensorStream.forEach((sensorData) {
      _calculateAverageTemps(sensorData);
    });
  }

  void _calculateAverageTemps(List<Sensor> sensorList) {
    double avgTemp = 0;
    for(Sensor sensor in sensorList) {
      if(knownCPUSensors.contains(sensor.name)) {
        avgTemp += sensor.temperature ?? 0;
      }
    }
    _setAverageTemp(avgTemp / knownCPUSensors.length);
  }

  void _setAverageTemp(double avgTemp){
    averageTempSensor.temperature = avgTemp;
    notifyListeners();
  }

  final List<String> knownCPUSensors = [
    'eACC MTR Temp Sensor0',
    'eACC MTR Temp Sensor3',
    'pACC MTR Temp Sensor8',
    'pACC MTR Temp Sensor7',
    'pACC MTR Temp Sensor5',
    'pACC MTR Temp Sensor4',
    'pACC MTR Temp Sensor3',
    'pACC MTR Temp Sensor2',
    'pACC MTR Temp Sensor9'
  ];
}