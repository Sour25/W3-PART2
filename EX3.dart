class CustomDuration {
  final int _ms;

  const CustomDuration._fromMilliseconds(this._ms);

  CustomDuration.fromHours(int hours)
    : assert(hours >= 0, 'Hours must be >= 0'),
      _ms = hours * 3600 * 1000;

  CustomDuration.fromMinutes(int minutes)
    : assert(minutes >= 0, 'Minutes must be >= 0'),
      _ms = minutes * 60 * 1000;

  CustomDuration.fromSeconds(int seconds)
    : assert(seconds >= 0, 'Seconds must be >= 0'),
      _ms = seconds * 1000;

  CustomDuration.fromMilliseconds(int ms)
    : assert(ms >= 0, 'Milliseconds must be >= 0'),
      _ms = ms;

  int get inMilliseconds => _ms;
  double get inSeconds => _ms / 1000.0;
  double get inMinutes => _ms / (60 * 1000.0);
  double get inHours => _ms / (3600 * 1000.0);

  // comparisons
  bool operator >(CustomDuration other) => _ms > other._ms;
  bool operator <(CustomDuration other) => _ms < other._ms;
  bool operator >=(CustomDuration other) => _ms >= other._ms;
  bool operator <=(CustomDuration other) => _ms <= other._ms;

  CustomDuration operator +(CustomDuration other) =>
      CustomDuration._fromMilliseconds(_ms + other._ms);

  CustomDuration operator -(CustomDuration other) {
    final diff = _ms - other._ms;
    return CustomDuration._fromMilliseconds(diff >= 0 ? diff : 0);
  }

  // to make sure it equality and hashCode
  @override
  bool operator ==(Object other) => other is CustomDuration && _ms == other._ms;

  @override
  int get hashCode => _ms.hashCode;

  @override
  String toString() => 'CustomDuration($_ms ms)';
}

void main() {
  final d1 = CustomDuration.fromHours(1);
  final d2 = CustomDuration.fromMinutes(30);
  final d3 = CustomDuration.fromSeconds(45);

  print('d1: $d1');
  print('d2: $d2');
  print('d3: $d3');
  print('d1 > d2 ? ${d1 > d2}');
  print('d1 + d2 = ${d1 + d2}');
  print('d2 - d1 = ${d2 - d1}');
}
