extension capitalize on String {
  String allCaps() {
    String ss = "";
    var z = this.split(" ").forEach((element) {
      var e = element[0].toUpperCase();
      ss += "$e${element.substring(1)} ";
    });
    return ss.trimRight();
  }
}
