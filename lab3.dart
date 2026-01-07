// ระบบจัดการสินค้า Ray-Ban

class Product {
  String _name;
  double _price;
  int _stock;

  // Constructor
  Product(this._name, this._price, this._stock);

  // Getter
  String get name => _name;
  double get price => _price;
  int get stock => _stock;

  // Setter
  set price(double value) {
    if (value > 0) {
      _price = value;
    }
  }

  set stock(int value) {
    if (value >= 0) {
      _stock = value;
    }
  }

  void showInfo() {
    print("ชื่อสินค้า: $_name");
    print("ราคา: $_price บาท");
    print("สต๊อก: $_stock ชิ้น");
  }
}

// สินค้าลดราคา (Inheritance)
class DiscountProduct extends Product {
  double _discount;

  DiscountProduct(
      String name, double price, int stock, this._discount)
      : super(name, price, stock);

  // Getter
  double get discount => _discount;

  // Setter
  set discount(double value) {
    if (value > 0 && value < 100) {
      _discount = value;
    }
  }

  double getDiscountPrice() {
    return price * (1 - _discount / 100);
  }

  @override
  void showInfo() {
    super.showInfo();
    print("ส่วนลด: $_discount %");
    print("ราคาหลังลด: ${getDiscountPrice()} บาท");
  }
}

void main() {
  // สินค้าทั่วไป
  Product p1 = Product("Ray-Ban Aviator", 4500, 10);
  p1.showInfo();

  print("-----------");

  // สินค้าลดราคา
  DiscountProduct p2 =
      DiscountProduct("Ray-Ban Wayfarer", 5000, 5, 20);
  p2.showInfo();
}

