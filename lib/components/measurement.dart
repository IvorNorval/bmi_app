class Measurement {
  final String name;
  final String unit;
  final int min;
  final int max;
  final int initialValue;
  int value;

  Measurement({
    this.name,
    this.unit,
    this.value,
    this.max,
    this.min,
    this.initialValue,
  }) {
    value = initialValue;
  }
}
