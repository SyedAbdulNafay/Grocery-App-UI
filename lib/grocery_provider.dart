import 'dart:ui';
import 'package:grocery_app_ui/item.dart';

int selectedIndex = 0;

List<Map<String, dynamic>> groceryCategories = [
  {
    "title": "Pulses",
    "image": "assets/Images/pulses.png",
    "color": const Color.fromRGBO(248, 164, 76, 0.25),
    "borderColor": const Color.fromRGBO(248, 164, 76, 1),
    "items": pulses
  },
  {
    "title": "Rice",
    "image": "assets/Images/sack-of-rice.png",
    "color": const Color.fromRGBO(83, 177, 117, 0.25),
    "borderColor": const Color.fromRGBO(83, 177, 117, 1),
    "items": rice
  },
  {
    "title": "Fresh Fruits & Vegetable",
    "image": "assets/Images/fruit_basket.png",
    "color": const Color.fromRGBO(83, 177, 117, 0.1),
    "borderColor": const Color.fromRGBO(83, 177, 117, 0.7),
    "items": fruitsAndVeg
  },
  {
    "title": "Cooking Oil & Ghee",
    "image": "assets/Images/oils.png",
    "color": const Color.fromRGBO(248, 164, 176, 0.1),
    "borderColor": const Color.fromRGBO(248, 164, 176, 0.7),
    "items": oils
  },
  {
    "title": "Meat & Fish",
    "image": "assets/Images/meat.png",
    "color": const Color.fromRGBO(247, 165, 147, 0.25),
    "borderColor": const Color.fromRGBO(247, 165, 147, 1),
    "items": meat
  },
  {
    "title": "Bakery & Snacks",
    "image": "assets/Images/bakery.png",
    "color": const Color.fromRGBO(211, 176, 224, 0.25),
    "borderColor": const Color.fromRGBO(211, 176, 224, 1),
    "items": bakery
  },
  {
    "title": "Dairy & Eggs",
    "image": "assets/Images/dairy.png",
    "color": const Color.fromRGBO(253, 229, 152, 0.25),
    "borderColor": const Color.fromRGBO(253, 229, 152, 1),
    "items": dairy
  },
  {
    "title": "Beverages",
    "image": "assets/Images/beverages.png",
    "color": const Color.fromRGBO(183, 223, 245, 0.25),
    "borderColor": const Color.fromRGBO(183, 223, 245, 1),
    "items": beverages
  },
];

List<Item> beverages = [
  Item(
    detail: "Refreshing and sugar-free, Diet Coke is a popular carbonated beverage enjoyed by many. With its crisp taste and zero calories, it's a guilt-free choice for those watching their sugar intake.",
    image: "assets/Images/dietcoke_can.png",
    title: "Diet Coke",
    quantity: "355ml",
    price: 1.99,
  ),
  Item(
      detail: "Sprite is a lemon-lime flavored soda known for its crisp and refreshing taste. It's caffeine-free and offers a burst of citrus flavor that's perfect for quenching your thirst on a hot day.",
      image: "assets/Images/sprite_can.png",
      title: "Sprite Can",
      quantity: "325ml",
      price: 1.50),
  Item(
      detail: "This blend of apple and grape juices offers a sweet and fruity taste packed with vitamins and antioxidants. Enjoy it chilled as a refreshing beverage for breakfast or throughout the day.",
      image: "assets/Images/apple_juice.png",
      title: "Apple & Grape Juice",
      quantity: "2L",
      price: 15.99),
  Item(
      detail: "Freshly squeezed orange juice is a classic breakfast staple known for its tangy and citrusy flavor. Packed with vitamin C and other essential nutrients, it's a healthy choice to start your day.",
      image: "assets/Images/orange_juice.png",
      title: "Orange Juice",
      quantity: "2L",
      price: 15.99),
  Item(
      detail: "Coca-Cola, the iconic cola beverage, is beloved worldwide for its unique taste and effervescence. Enjoy it chilled over ice or mixed with your favorite spirits for a classic beverage experience.",
      image: "assets/Images/coke_can.png",
      title: "Coca Cola Can",
      quantity: "325ml",
      price: 4.99),
  Item(
      detail: "Pepsi is a refreshing cola beverage with a bold and bubbly flavor loved by many. Whether enjoyed on its own or paired with your favorite snacks, it's a satisfying drink for any occasion.",
      image: "assets/Images/pepsi_can.png",
      title: "Pepsi Can",
      quantity: "330ml",
      price: 4.99),
];

List<Item> pulses = [
  Item(
      detail:
          "Nutrient-rich black beans, a staple in many cuisines, are packed with protein, fiber, and essential vitamins and minerals. Perfect for soups, stews, salads, and side dishes.",
      image: 'assets/Images/black_beans.png',
      title: "Black Beans",
      quantity: "500g",
      price: 2.50),
  Item(
      detail:
          " Also known as Bengal gram or split chickpeas, Chanay Dal is high in protein and fiber, making it a nutritious addition to various Indian dishes like dal, curries, and snacks.",
      image: 'assets/Images/chanay.png',
      title: "Chanay Dal",
      quantity: "500g",
      price: 2.20),
  Item(
      detail:
          "Versatile and nutritious, chickpeas are a good source of plant-based protein, fiber, and several vitamins and minerals. Ideal for making hummus, salads, curries, and soups.",
      image: 'assets/Images/chickpeas.png',
      title: "Chickpeas",
      quantity: "500g",
      price: 2.80),
  Item(
      detail:
          " Kidney beans, with their robust flavor and firm texture, are a pantry staple. Rich in protein, fiber, and antioxidants, they are perfect for chili, salads, and bean-based dishes.",
      image: 'assets/Images/kidney_beans.png',
      title: "Kidney Beans",
      quantity: "500g",
      price: 2.10),
  Item(
      detail:
          "Black-eyed peas are small, creamy beans with a slightly nutty flavor. They are a good source of protein, fiber, and folate. Enjoy them in soups, stews, salads, and rice dishes.",
      image: 'assets/Images/lobia.png',
      title: "Black Eyed Peas",
      quantity: "500g",
      price: 2.30),
  Item(
      detail:
          "Masoor dal, also known as red lentils, is a quick-cooking pulse rich in protein, fiber, and iron. Use it to prepare flavorful dal, soups, stews, and Indian curries.",
      image: 'assets/Images/masoor_daal.png',
      title: "Masoor Dal",
      quantity: "500g",
      price: 2.40),
  Item(
      detail:
          "Soybeans are a versatile legume packed with protein, fiber, and essential nutrients. Enjoy them boiled as a snack, added to salads, stir-fries, or processed into tofu and soy milk.",
      image: 'assets/Images/soybean.png',
      title: "Soy Beans",
      quantity: "500g",
      price: 3.00),
];

List<Item> rice = [
  Item(
      detail:
          "Arborio rice is a short-grain Italian rice known for its high starch content and creamy texture when cooked. Perfect for making risotto, rice pudding, and other creamy dishes.",
      image: 'assets/Images/arborio_rice.png',
      title: "Arborio Rice",
      quantity: "1kg",
      price: 6.00),
  Item(
      detail:
          "Basmati rice is a fragrant, long-grain rice variety with a delicate flavor and fluffy texture when cooked. It pairs well with various cuisines, especially Indian, Middle Eastern, and Asian dishes.",
      image: 'assets/Images/basmati_rice.png',
      title: "Basmati Rice",
      quantity: "1kg",
      price: 7.50),
  Item(
      detail:
          "White rice is a whole grain rice with the bran intact, providing fiber, vitamins, and minerals. It has a nutty flavor and chewy texture, ideal for pilafs, stir-fries, and grain bowls.",
      image: 'assets/Images/sack-of-rice.png',
      title: "White Rice",
      quantity: "1kg",
      price: 5.50),
  Item(
      detail:
          "Brown rice is a whole grain rice with the bran intact, providing fiber, vitamins, and minerals. It has a nutty flavor and chewy texture, ideal for pilafs, stir-fries, and grain bowls.",
      image: 'assets/Images/brown_rice.png',
      title: "Brown Rice",
      quantity: "1kg",
      price: 6.50),
];

List<Item> fruitsAndVeg = [
  Item(
      detail:
          "Crisp and juicy apples are a classic fruit packed with vitamins, fiber, and antioxidants. Enjoy them fresh as a snack, sliced in salads, or baked into pies and desserts.",
      image: 'assets/Images/apple.png',
      title: "Apples",
      quantity: '1kg',
      price: 1.50),
  Item(
      detail:
          "Sweet and creamy bananas are a nutritious tropical fruit rich in potassium, fiber, and vitamins. Enjoy them as a convenient snack, blended into smoothies, or sliced over oatmeal and yogurt.",
      image: 'assets/Images/banana.png',
      title: "Banana",
      quantity: '12 pieces',
      price: 8.00),
  Item(
      detail:
          "Vibrant bell peppers come in various colors and are rich in vitamins, especially vitamin C. Add them to salads, stir-fries, fajitas, or stuff them with savory fillings for a nutritious meal.",
      image: 'assets/Images/bellpepper.png',
      title: "Bell Pepper",
      quantity: '250g',
      price: 1.20),
  Item(
      detail:
          "Sweet and tangy blueberries are small but mighty, packed with antioxidants, fiber, and vitamins. Enjoy them fresh as a snack, in smoothies, yogurt parfaits, or baked goods.",
      image: 'assets/Images/blueberries.png',
      title: "Blue Berries",
      quantity: '500g',
      price: 4.00),
  Item(
      detail:
          "Nutrient-rich broccoli is a cruciferous vegetable packed with vitamins, minerals, and antioxidants. Steam, roast, or stir-fry broccoli to enjoy its crunchy texture and earthy flavor.",
      image: 'assets/Images/brocolli.png',
      title: "Brocolli",
      quantity: '500g',
      price: 1.80),
  Item(
      detail:
          "Sweet and crunchy carrots are a versatile vegetable packed with beta-carotene, fiber, and vitamins. Enjoy them raw as a snack, grated in salads, or cooked in soups and stews.",
      image: 'assets/Images/carrots.png',
      title: "Carrots",
      quantity: '500g',
      price: 1.00),
  Item(
      detail:
          "Juicy and refreshing grapes are a delicious fruit rich in antioxidants, vitamins, and minerals. Enjoy them fresh as a snack, frozen for a cool treat, or in salads and desserts.",
      image: 'assets/Images/grapes.png',
      title: "Grapes",
      quantity: '500g',
      price: 3.50),
  Item(
      detail:
          "Versatile and comforting potatoes are a staple vegetable packed with carbohydrates, fiber, and essential nutrients. Enjoy them baked, mashed, roasted, or in soups and casseroles.",
      image: 'assets/Images/potatos.png',
      title: "Potatos",
      quantity: '1kg',
      price: 1.00),
  Item(
      detail:
          "Nutrient-dense spinach is a leafy green packed with iron, vitamins, and antioxidants. Enjoy it raw in salads, sautéed with garlic, or added to soups, omelets, and smoothies.",
      image: 'assets/Images/spinach.png',
      title: "Spinach",
      quantity: '1kg',
      price: 2.00),
  Item(
      detail:
          "Juicy and flavorful tomatoes are a versatile fruit rich in vitamins, minerals, and antioxidants. Enjoy them raw in salads, sliced on sandwiches, or cooked in sauces and soups.",
      image: 'assets/Images/tomatoes.png',
      title: "Tomatoes",
      quantity: '1kg',
      price: 1.50),
];

List<Item> oils = [
  Item(
      detail:
          "Canola oil is a versatile and neutral-flavored oil derived from rapeseed. It has a high smoke point, making it suitable for frying, baking, and sautéing various dishes.",
      image: 'assets/Images/canola_oil.png',
      title: "Canola Oil",
      quantity: "1 bottle",
      price: 5.80),
  Item(
      detail:
          "Extra virgin olive oil is a premium oil made from cold-pressed olives, prized for its fruity flavor and health benefits. Use it for dressing salads, drizzling over roasted vegetables, or dipping with bread.",
      image: 'assets/Images/olive_oil.png',
      title: "Olive Oil",
      quantity: "1 bottle",
      price: 8.50),
  Item(
      detail:
          " Sunflower oil is a light and mild oil extracted from sunflower seeds. It has a high smoke point, making it ideal for frying, baking, and cooking a variety of dishes.",
      image: 'assets/Images/sunflower_oil.png',
      title: "Sunflower Oil",
      quantity: "1 bottle",
      price: 5.00),
  Item(
      detail:
          "Vegetable oil is a blend of different plant-based oils such as soybean, corn, and sunflower oil. It has a neutral flavor and is suitable for frying, baking, and general cooking purposes.",
      image: 'assets/Images/vegetable_oil.png',
      title: "Vegetable Oil",
      quantity: "1 bottle",
      price: 4.50),
];

List<Item> meat = [
  Item(
      detail:
          "Premium quality beef, sourced from grass-fed cattle, is rich in protein and essential nutrients. Ideal for grilling, roasting, stir-frying, or braising to create flavorful meat dishes.",
      image: 'assets/Images/beef.png',
      title: "Beef",
      quantity: "1kg",
      price: 10.00),
  Item(
      detail:
          "Tender and lean chicken breast meat is a versatile protein option that can be grilled, baked, sautéed, or sliced for sandwiches and salads. It's a healthy choice for various culinary creations.",
      image: 'assets/Images/chicken_chest.png',
      title: "Chicken Chest",
      quantity: "1kg",
      price: 7.50),
  Item(
      detail:
          " Chicken thighs are flavorful and juicy cuts of poultry with a slightly higher fat content, making them ideal for braising, roasting, grilling, or slow-cooking in stews and curries.",
      image: 'assets/Images/chicken_thighs.png',
      title: "Chicken Thighs",
      quantity: "1kg",
      price: 6.80),
  Item(
      detail:
          "Fresh salmon fillets, rich in omega-3 fatty acids and protein, are prized for their delicate flavor and moist texture. Grill, bake, roast, or pan-sear salmon for a nutritious and delicious meal.",
      image: 'assets/Images/salmon.png',
      title: "Salmon",
      quantity: "1kg",
      price: 12.50),
  Item(
      detail:
          "Plump and succulent shrimp are versatile seafood delicacies packed with protein and essential nutrients. Grill, sauté, stir-fry, or steam shrimp for quick and tasty seafood dishes.",
      image: 'assets/Images/shrimp.png',
      title: "Shrimp",
      quantity: "1kg",
      price: 15.00),
  Item(
      detail:
          "Mild and flaky tilapia fillets are a popular white fish known for their versatility and affordability. Bake, grill, pan-fry, or broil tilapia for a healthy and delicious seafood option.",
      image: 'assets/Images/tilapia.png',
      title: "Tilapia",
      quantity: "1kg",
      price: 8.00),
  Item(
      detail:
          "Firm and meaty tuna steaks are prized for their rich flavor and high protein content. Grill, sear, bake, or enjoy tuna raw in sushi and sashimi for a gourmet seafood experience.",
      image: 'assets/Images/tuna.png',
      title: "Tuna",
      quantity: "1kg",
      price: 11.0),
];

List<Item> bakery = [
  Item(
      detail:
          "Soft and chewy bagels are a classic breakfast staple perfect for toasting and topping with cream cheese, smoked salmon, or avocado for a satisfying meal or snack.",
      image: 'assets/Images/bagel.png',
      title: "Bagel",
      quantity: "6 pieces",
      price: 2.20),
  Item(
      detail:
          "Freshly baked bread, with its crusty exterior and soft interior, is perfect for sandwiches, toast, or dipping into soups and sauces. Enjoy it plain or with your favorite toppings.",
      image: 'assets/Images/bread.png',
      title: "Bread",
      quantity: "6 pieces",
      price: 1.80),
  Item(
      detail:
          "Creamy and rich butter adds flavor and richness to baked goods, sauces, and spreads. Spread it on toast, melt it over vegetables, or use it for baking and cooking.",
      image: 'assets/Images/butter.png',
      title: "Butter",
      quantity: "6 pieces",
      price: 3.00),
  Item(
      detail:
          "Indulgent and delicious cookies come in a variety of flavors and textures, perfect for satisfying your sweet tooth. Enjoy them with a glass of milk or as a treat on their own.",
      image: 'assets/Images/cookies.png',
      title: "Cookies",
      quantity: "6 pieces",
      price: 2.50),
  Item(
      detail:
          "Buttery and flaky croissants are a French pastry delight enjoyed for breakfast, brunch, or as a snack. Pair them with jam, chocolate spread, or cheese for a delightful treat.",
      image: 'assets/Images/croissant.png',
      title: "Croissant",
      quantity: "6 pieces",
      price: 3.20),
  Item(
      detail:
          "Thin and tender egg noodles are a versatile pasta option perfect for soups, stir-fries, and noodle dishes. Cook them al dente and toss with your favorite sauce or broth for a satisfying meal.",
      image: 'assets/Images/egg_noodles.png',
      title: "Egg Noodles",
      quantity: "1 packet",
      price: 1.50),
  Item(
      detail:
          "Crispy and flavorful Lay's potato chips are a popular snack enjoyed for their irresistible crunch and savory taste. Pair them with sandwiches, burgers, or enjoy them on their own.",
      image: 'assets/Images/lays.png',
      title: "Lays",
      quantity: "1 packet",
      price: 2.00),
  Item(
      detail:
          "Creamy and tangy mayonnaise is a versatile condiment used in sandwiches, salads, dips, and dressings. Add it to your favorite dishes for a rich and flavorful taste.",
      image: 'assets/Images/mayonaise.png',
      title: "Mayonaise",
      quantity: "1 packet",
      price: 2.80),
  Item(
      detail:
          "Moist and fluffy muffins come in various flavors such as blueberry, chocolate chip, or banana nut, perfect for breakfast, snacks, or dessert. Enjoy them warm with a cup of coffee or tea.",
      image: 'assets/Images/muffin.png',
      title: "Muffin",
      quantity: "6 pieces",
      price: 4.00),
  Item(
      detail:
          "Long and slender noodles are a staple ingredient in many Asian cuisines, perfect for stir-fries, soups, and noodle dishes. Cook them to your desired texture and pair with your favorite sauces and toppings.",
      image: 'assets/Images/noodles.png',
      title: "Noodles",
      quantity: "1 packet",
      price: 1.20),
  Item(
      detail:
          "Versatile pasta comes in various shapes and sizes, perfect for creating comforting and delicious dishes. Pair it with your favorite sauce, vegetables, or protein for a satisfying meal.",
      image: 'assets/Images/pasta.png',
      title: "Pasta",
      quantity: "1 packet",
      price: 1.80),
  Item(
      detail:
          "Light and airy popcorn kernels pop into fluffy and crunchy snacks perfect for movie nights, parties, or anytime cravings. Enjoy them plain, buttered, or seasoned with your favorite flavors.",
      image: 'assets/Images/popcorn.png',
      title: "Popcorn",
      quantity: "1 packet",
      price: 1.50),
];

List<Item> dairy = [
  Item(
      detail:
          "Creamy and flavorful butter adds richness to baked goods, sauces, and spreads. Spread it on toast, melt it over vegetables, or use it for cooking and baking.",
      image: 'assets/Images/butter.png',
      title: "Butter",
      quantity: "1 packet",
      price: 1.80),
  Item(
      detail:
          "Sharp and tangy cheddar cheese is a versatile cheese variety perfect for sandwiches, burgers, salads, or cheese boards. Enjoy it sliced, shredded, or melted in your favorite dishes.",
      image: 'assets/Images/cheddar_cheese.png',
      title: "Cheddar Cheese",
      quantity: "1 packet",
      price: 3.50),
  Item(
      detail:
          "Egg whites are a low-calorie, high-protein food perfect for omelets, scrambles, baking, and protein shakes. They are cholesterol-free and a great source of essential amino acids.",
      image: 'assets/Images/eggs_white.png',
      title: "Eggs White",
      quantity: "12",
      price: 2.00),
  Item(
      detail:
          "Farm-fresh red eggs, rich in protein and essential nutrients, are a versatile ingredient perfect for breakfast, baking, salads, and sandwiches. Enjoy them boiled, scrambled, or fried.",
      image: 'assets/Images/eggs_red.png',
      title: "Eggs Red",
      quantity: "12",
      price: 2.20),
  Item(
      detail:
          "Fresh and creamy milk is a nutritious dairy staple rich in calcium, vitamins, and minerals. Enjoy it cold, warm, or use it for making beverages, desserts, and savory dishes.",
      image: 'assets/Images/milk.png',
      title: "Milk",
      quantity: "1kg",
      price: 2.50),
  Item(
      detail:
          "Soft and mild mozzarella cheese is a classic Italian cheese variety perfect for pizzas, pasta dishes, salads, and sandwiches. Enjoy it melted, sliced, or shredded for a creamy texture.",
      image: 'assets/Images/mozzarella_cheese.png',
      title: "Mozzarella Cheese",
      quantity: "1 packet",
      price: 3.00),
  Item(
      detail:
          "Creamy and tangy yogurt is a versatile dairy product perfect for breakfast, snacks, or as an ingredient in sauces, dressings, and desserts. Enjoy it plain or flavored with fruits and honey.",
      image: 'assets/Images/yogurt.png',
      title: "Yogurt",
      quantity: "1 packet",
      price: 1.80),
];

List<Map<String, dynamic>> options1 = [
  {"title": "Cheapest", "isTicked": false},
  {"title": "Most Expensive", "isTicked": false},
  {"title": "Alphabetically", "isTicked": false},
  {"title": "Rating", "isTicked": false}
];

List<Map<String, dynamic>> options2 = [
  {"title": "Individual Callection", "isTicked": false},
  {"title": "Cocola", "isTicked": false},
  {"title": "Ifad", "isTicked": false},
  {"title": "Kazi Farmas", "isTicked": false}
];

List<Item> exclusive = [
  groceryCategories[0]['items'][2],
  groceryCategories[1]['items'][2],
  groceryCategories[2]['items'][2],
  groceryCategories[3]['items'][2],
  groceryCategories[4]['items'][2],
  groceryCategories[5]['items'][2],
  groceryCategories[6]['items'][2],
  groceryCategories[7]['items'][2],
];

List<Item> bestSelling = [
  groceryCategories[0]['items'][2],
  groceryCategories[1]['items'][1],
  groceryCategories[2]['items'][0],
  groceryCategories[3]['items'][2],
  groceryCategories[4]['items'][2],
  groceryCategories[5]['items'][1],
  groceryCategories[6]['items'][0],
  groceryCategories[7]['items'][0],
];

sortCheapest(List<Item> list) {
  list.sort((a, b) => a.price.compareTo(b.price));
}
