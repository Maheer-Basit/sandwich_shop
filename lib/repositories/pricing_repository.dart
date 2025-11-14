class PricingRepository {
  final double _sixInchPrice = 7.0;
  final double _footlongPrice = 11.0;
  double _totalPrice = 0.0;
  
  double get sixInchPrice => _sixInchPrice;
  double get footlongPrice => _footlongPrice;
  double get totalPrice => _totalPrice;
  
  void calculateTotalPrice(int quantity, bool isFootlong) {
    if (isFootlong) {
      _totalPrice = quantity * _footlongPrice;
    } else {
      _totalPrice = quantity * _sixInchPrice;
    }
  }
}