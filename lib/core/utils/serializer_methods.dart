int toInt(val) {
  if (val is int) return val;
  if (val is String) return int.tryParse(val) ?? 0;
  if (val is double) return val.toInt();
  return 0;
}

double toDouble(val) {
  if (val is double) return val;
  if (val is int) return val.toDouble();
  if (val is String) return double.tryParse(val) ?? 0;
  return 0;
}
