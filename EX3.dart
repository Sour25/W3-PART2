class CustomDuration {
  final int _ms;

  const CustomDuration._fromMilliseconds(this._ms);

  factory CustomDuration.fromHours(int hours) {
    if (hours < 0) throw ArgumentError('Hours must be >= 0');
    return CustomDuration._fromMilliseconds(hours * 3600 * 1000);
  }

  factory CustomDuration.fromMinutes(int minutes) {
    if (minutes < 0) throw ArgumentError('Minutes must be >= 0');
    return CustomDuration._fromMilliseconds(minutes * 60 * 1000);
  }

  factory CustomDuration.fromSeconds(int seconds) {
    if (seconds < 0) throw ArgumentError('Seconds must be >= 0');
    return CustomDuration._fromMilliseconds(seconds * 1000);
  }

  factory CustomDuration.fromMilliseconds(int ms) {
    if (ms < 0) throw ArgumentError('Milliseconds must be >= 0');
    return CustomDuration._fromMilliseconds(ms);
  }

  int get inMilliseconds => _ms;
  double get inSeconds => _ms / 1000.0;
  double get inMinutes => _ms / (60 * 1000.0);
  double get inHours => _ms / (3600 * 1000.0);

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

  @override
  bool operator ==(Object other) => other is CustomDuration && _ms == other._ms;

  @override
  int get hashCode => _ms.hashCode;

  @override
  String toString() => 'CustomDuration($_ms ms)';
}

void main() {
  final d1 = CustomDuration.fromHours(1);
  final d2 = CustomDuration.fromMinutes(45);
  final d3 = CustomDuration.fromSeconds(30);

  print('d1 = $d1');
  print('d2 = $d2');
  print('d3 = $d3');
  print('d1 > d2 ? ${d1 > d2}');
  print('d1 + d2 = ${d1 + d2}');
  print('d2 - d1 = ${d2 - d1}');
}
