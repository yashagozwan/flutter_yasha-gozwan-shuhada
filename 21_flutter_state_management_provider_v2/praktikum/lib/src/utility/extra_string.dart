extension ExtraString on String {
  String toCapital() {
    final words = split(' ');
    final transform = words.map(
      (e) => e[0].toUpperCase() + e.substring(1).toLowerCase(),
    );
    return transform.join(' ');
  }
}
