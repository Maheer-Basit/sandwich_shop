import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('initial price should be 0.0', () {
      final repository = PricingRepository();
      expect(repository.totalPrice, 0.0);
    });

    test('calculateTotalPrice should calculate correct price for footlong', () {
      final repository = PricingRepository();
      repository.calculateTotalPrice(3, true);
      expect(repository.totalPrice, 33.0); 
    });

    test('calculateTotalPrice should calculate correct price for six-inch', () {
      final repository = PricingRepository();
      repository.calculateTotalPrice(4, false);
      expect(repository.totalPrice, 28.0); 
    });

    test('prices are read-only', () {
      final repository = PricingRepository();
      expect(repository.sixInchPrice, 7.0);
      expect(repository.footlongPrice, 11.0);
    });
  });
}
