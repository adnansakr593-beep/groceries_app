class ItemModel 
{
  String imagePath;
  String name;
  String unit;
  String descreption;
  double price;

  ItemModel
  (
    {
      required this.name,
      required this.unit,
      required this.price,
      required this.imagePath,
      required this.descreption
    }
  );
}