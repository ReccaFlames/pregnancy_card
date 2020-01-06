class Product {
  int id;
  String _name;
  String _category;
  String _description;
  List<String> _imagesPaths;
  List<String> _orderPages;
  bool _status = false;

  Product(this.id, this._name, this._category);

  getName() {
    return _name;
  }

  getCategory() {
    return _category;
  }

  getStatus() {
    return _status;
  }

  invertStatus() {
    _status = !_status;
  }
}