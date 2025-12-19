import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_state.dart';
import 'package:groceries_app/models/cart_shop.dart';
import 'package:groceries_app/models/item_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItemModel> cart = [];

  void additemtocart(ItemModel item, int quantity) {
    final index = cart.indexWhere((e) => e.item.name == item.name);

    if (index != -1) {
      cart[index].quantity += quantity;
    } else {
      cart.add(CartItemModel(item: item, quantity: quantity));
    }
    emit(CartAddSucss());
  }

  void cartDelelte(ItemModel item) {
    cart.removeWhere((e) => e.item.name == item.name);
    emit(CartDelelte());
  }

  double totalCartPrice() {
    double total = 0;

    for (var cartItem in cart) {
      total += cartItem.item.price * cartItem.quantity;
    }

    return double.parse(total.toStringAsFixed(2));
  }

  void addOneItem(ItemModel item) {
    final index = cart.indexWhere((e) => e.item.name == item.name);

    if (index != -1) {
      cart[index].quantity++;
    }
    emit(CartAddSucss());
  }

  void deleteOneItem(ItemModel item) {
    final index = cart.indexWhere((e) => e.item.name == item.name);

    if (index != -1) {
      if (cart[index].quantity > 1) {
        cart[index].quantity--;
      } else {
        cart.removeAt(index);
      }
      emit(CartDelelte());
    }
  }

  final List<ItemModel> _exclusiveOfferItems = [
    ItemModel(
      name: 'Beef',
      unit: '1kg, Price',
      price: 19.99,
      imagePath: 'assets/images/beef.png',
      descreption:
          'Fresh beef, high quality and suitable for grilling or stewing.',
    ),
    ItemModel(
      name: 'Chicken',
      unit: '1kg, Price',
      price: 12.99,
      imagePath: 'assets/images/chicken.png',
      descreption:
          'Fresh chicken, tender and juicy, perfect for roasting or frying.',
    ),
    ItemModel(
      name: 'Red Apple',
      unit: '1kg, Priceg',
      price: 4,
      imagePath: 'assets/images/red_apple.png',
      descreption: 'Crisp and sweet red apples, ideal for snacks or desserts.',
    ),
    ItemModel(
      name: 'Organic Bananas',
      unit: '7pcs, Priceg',
      price: 5,
      imagePath: 'assets/images/right_banan.png',
      descreption:
          'Ripe organic bananas, naturally sweet and full of nutrients.',
    ),
    ItemModel(
      name: 'Bell Pepper Red',
      unit: '1kg, Priceg',
      price: 3,
      imagePath: 'assets/images/red pepper.png',
      descreption:
          'Fresh red bell peppers, crunchy and perfect for salads or cooking.',
    ),
  ];

  final List<ItemModel> _bestSellingItems = [
    ItemModel(
      name: 'Noodles',
      unit: '2L, Price',
      price: 15.99,
      imagePath: 'assets/images/noodels.png',
      descreption:
          'Quick-cook noodles, perfect for fast meals and easy recipes.',
    ),
    ItemModel(
      name: 'Milk',
      unit: '1L, Price',
      price: 1.99,
      imagePath: 'assets/images/milk.png',
      descreption: 'Fresh and pure milk, rich in calcium and vitamins.',
    ),
    ItemModel(
      name: 'Creamy Cheese',
      unit: '200g, Price',
      price: 5.99,
      imagePath: 'assets/images/creamy_chease.png',
      descreption:
          'Smooth and creamy cheese, ideal for sandwiches and cooking.',
    ),
    ItemModel(
      name: 'Egg Chicken Red',
      unit: '4pcs, Price',
      price: 1.99,
      imagePath: 'assets/images/eggs.png',
      descreption: 'Fresh chicken eggs, perfect for baking or breakfast.',
    ),
    ItemModel(
      name: 'Olive Oil',
      unit: '1L, Price',
      price: 25.99,
      imagePath: 'assets/images/oil.png',
      descreption: 'Premium olive oil, cold-pressed and rich in flavor.',
    ),
    ItemModel(
      name: 'Pasta ',
      unit: '30gm, Price',
      price: 15.99,
      imagePath: 'assets/images/macrona.png',
      descreption: 'High-quality pasta, cooks evenly and perfect with sauces.',
    ),
  ];

  final List<ItemModel> _drinks = [
    ItemModel(
      name: 'Pepsi Can',
      unit: '355ml, Price',
      price: 1.99,
      imagePath: 'assets/images/pepsi.png',
      descreption: 'Refreshing Pepsi, classic soda taste in a convenient can.',
    ),
    ItemModel(
      name: 'Diet Coke',
      unit: '355ml, Price',
      price: 1.99,
      imagePath: 'assets/images/dite_coke.png',
      descreption: 'Zero sugar, refreshing diet cola for a guilt-free drink.',
    ),
    ItemModel(
      name: 'Sprite Can',
      unit: '325ml, Price',
      price: 1.50,
      imagePath: 'assets/images/sprite.png',
      descreption: 'Lemon-lime soda, crisp and refreshing.',
    ),
    ItemModel(
      name: 'Coca Cola Can',
      unit: '325ml, Price',
      price: 4.99,
      imagePath: 'assets/images/cocacola.png',
      descreption: 'Classic Coca Cola, sweet and fizzy, perfect for any time.',
    ),
    ItemModel(
      name: 'Orenge Juice',
      unit: '2L, Price',
      price: 15.99,
      imagePath: 'assets/images/orange_juice.png',
      descreption: 'Freshly squeezed orange juice, rich in vitamin C.',
    ),
    ItemModel(
      name: 'Apple & Grape Juice',
      unit: '2L, Price',
      price: 15.99,
      imagePath: 'assets/images/strabrary_juice.png',
      descreption:
          'Blend of apple and grape juice, naturally sweet and refreshing.',
    ),
  ];

  final List<ItemModel> _fruitsAndvegetables = [
    ItemModel(
      name: 'Banana',
      unit: '1kg, Price',
      price: 3.75,
      imagePath: 'assets/images/right_banan.png',
      descreption: 'Fresh bananas, sweet and full of nutrients.',
    ),
    ItemModel(
      name: 'Red Apple',
      unit: '1kg, Price',
      price: 4.99,
      imagePath: 'assets/images/red_apple.png',
      descreption: 'Juicy red apples, ideal for snacking or cooking.',
    ),
    ItemModel(
      name: 'Ginger',
      unit: '250g, Price',
      price: 2.50,
      imagePath: 'assets/images/ginger.png',
      descreption:
          'Fresh ginger, spicy and aromatic, perfect for cooking or tea.',
    ),

    ItemModel(
      name: 'Red Pepper',
      unit: '500g, Price',
      price: 3.99,
      imagePath: 'assets/images/red pepper.png',
      descreption: 'Crisp red peppers, perfect for cooking or salads.',
    ),
  ];

  final List<ItemModel> _meat = [
    ItemModel(
      name: 'Beef',
      unit: '1kg, Price',
      price: 19.99,
      imagePath: 'assets/images/beef.png',
      descreption: 'Fresh and tender beef, perfect for grilling or stewing.',
    ),
    ItemModel(
      name: 'Chicken',
      unit: '1kg, Price',
      price: 12.99,
      imagePath: 'assets/images/chicken.png',
      descreption: 'Fresh chicken, ideal for roasting or frying.',
    ),
    ItemModel(
      name: 'Mixed Meat',
      unit: '1kg, Price',
      price: 17.99,
      imagePath: 'assets/images/meet.png',
      descreption: 'A mix of premium meats, ready for cooking various recipes.',
    ),
  ];

  final List<ItemModel> _dairy = [
    ItemModel(
      name: 'Milk',
      unit: '1L, Price',
      price: 1.99,
      imagePath: 'assets/images/milk.png',
      descreption: 'Fresh milk, rich in calcium and essential nutrients.',
    ),
    ItemModel(
      name: 'Creamy Cheese',
      unit: '200g, Price',
      price: 5.99,
      imagePath: 'assets/images/creamy_chease.png',
      descreption: 'Smooth, creamy cheese, ideal for cooking or sandwiches.',
    ),
  ];

  final List<ItemModel> _oils = [
    ItemModel(
      name: 'Olive Oil',
      unit: '1L, Price',
      price: 25.99,
      imagePath: 'assets/images/oil.png',
      descreption:
          'Premium extra virgin olive oil, cold-pressed for best quality.',
    ),
  ];

  final List<ItemModel> _pasta = [
    ItemModel(
      name: 'Macaroni',
      unit: '500g, Price',
      price: 2.99,
      imagePath: 'assets/images/macrona.png',
      descreption:
          'High-quality macaroni pasta, cooks evenly and tastes great.',
    ),
    ItemModel(
      name: 'Instant Noodles',
      unit: '75g, Price',
      price: 1.20,
      imagePath: 'assets/images/noodles.png',
      descreption: 'Quick and easy instant noodles, perfect for a fast meal.',
    ),
  ];

  List<ItemModel> get bestSellingItems => _bestSellingItems;

  List<ItemModel> get exclusiveOfferItems => _exclusiveOfferItems;

  List<ItemModel> get drinks => _drinks;
  List<ItemModel> get fruits => _fruitsAndvegetables;
  List<ItemModel> get meat => _meat;
  List<ItemModel> get dairy => _dairy;
  List<ItemModel> get oils => _oils;
  List<ItemModel> get pasta => _pasta;
}
