class Filter {
  Filter({
    required this.name,
    required this.kod,
    required this.items,
  });

  String name;
  String kod;
  List<FilterItem> items;

  Filter.empty()
      : name = '',
        kod = '',
        items = [];
}

class FilterItem {
  FilterItem({
    required this.item,
    required this.selected,
  });
  String item;
  bool selected;
}
