import 'dart:io';

class Product {
  String name;
  String desc;
  double price;

  Product(this.name, this.desc, this.price);

  @override
  String toString() {
    return 'Name: $name\nDescription: $desc\nPrice: \$${price.toStringAsFixed(2)}';
  }
}

class ProductManager {
  final Map<int, Product> products = {};
  int nextId = 1;

  void addProduct(Product p) {
    products[nextId++] = p;
    print('Product added successfully.');
  }

  void viewAllProducts() {
    if (products.isEmpty) {
      print('No products available.');
      return;
    }
    products.forEach((id, p) {
      print('Product ID: $id');
      print(p);
      print('---');
    });
  }

  void viewProduct(int id) {
    if (products.containsKey(id)) {
      print('Product ID: $id');
      print(products[id]);
    } else {
      print('Product not found.');
    }
  }

  void editProduct(int id, {String? name, String? desc, double? price}) {
    if (products.containsKey(id)) {
      var p = products[id]!;
      if (name != null) p.name = name;
      if (desc != null) p.desc = desc;
      if (price != null) p.price = price;
      print('Product updated successfully.');
    } else {
      print('Product not found.');
    }
  }

  void deleteProduct(int id) {
    if (products.containsKey(id)) {
      products.remove(id);
      print('Product deleted successfully.');
    } else {
      print('Product not found.');
    }
  }
}

void main() {
  final manager = ProductManager();
  
  while (true) {
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Choose an option: ');

    var choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        stdout.write('Enter product name: ');
        var name = stdin.readLineSync()!;
        stdout.write('Enter product description: ');
        var desc = stdin.readLineSync()!;
        stdout.write('Enter product price: ');
        var price = double.parse(stdin.readLineSync()!);
        manager.addProduct(Product(name, desc, price));
        break;
      case '2':
        manager.viewAllProducts();
        break;
      case '3':
        stdout.write('Enter product ID to view: ');
        var id = int.parse(stdin.readLineSync()!);
        manager.viewProduct(id);
        break;
      case '4':
        stdout.write('Enter product ID to edit: ');
        var id = int.parse(stdin.readLineSync()!);
        stdout.write('Enter new name (leave empty to keep current): ');
        var name = stdin.readLineSync();
        stdout.write('Enter new description (leave empty to keep current): ');
        var desc = stdin.readLineSync();
        stdout.write('Enter new price (leave empty to keep current): ');
        var priceInput = stdin.readLineSync();
        double? price;
        if (priceInput != null && priceInput.isNotEmpty) {
          price = double.parse(priceInput);
        }
        manager.editProduct(id, name: name, desc: desc, price: price);
        break;
      case '5':
        stdout.write('Enter product ID to delete: ');
        var id = int.parse(stdin.readLineSync()!);
        manager.deleteProduct(id);
        break;
      case '6':
        print('Exiting...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
