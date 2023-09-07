import 'package:clean_architecture/features/dashboard/models/parse_response.dart';
import 'package:clean_architecture/features/dashboard/models/product/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../core/fixtures/data/product_response.dart';

void main() {
  test('Should parse response in correct format', () {
    final response = ParseResponse<Product>.fromMap(productListMap(),
        modifier: Product.fromJson);

    expect(response.data is Product, true);
  });
}
