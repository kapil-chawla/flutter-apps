import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';

class MyStore extends VxStore {
  CatalogModel catalog = CatalogModel();
  CartModel cart = CartModel();

  MyStore() {
    cart.catalog = catalog;
  }
}
