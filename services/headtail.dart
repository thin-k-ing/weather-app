String _currentApi = 'https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={key}';
String _forecastApi = 'https://api.openweathermap.org/data/2.5/forecast?q={city name}&appid={key}';
String _key = '180c1cf1f6bb4adf863a20f42b2732af';

String current(String city) {
  return _currentApi.replaceFirst('{city name}', city).replaceFirst('{key}', _key);
}

String forecast(String city) {
  return _forecastApi.replaceFirst('{city name}', city).replaceFirst('{key}', _key);
}