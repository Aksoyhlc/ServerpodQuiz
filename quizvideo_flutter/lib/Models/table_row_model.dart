import 'package:syncfusion_flutter_datagrid/datagrid.dart';

enum ColType {
  Text,
  Image,
  Number,
  Double,
  Date,
  DateTime,
  Widget,
}

class TableCellModel {
  dynamic data;
  //TableCellType type;

  TableCellModel({
    required this.data,
    // this.type = TableCellType.Text,
  });
}

class TableRowModel {
  List<TableCellModel> cells;
  TableRowModel({required this.cells});
}

class TableColumnModel {
  String title;
  String? name;
  ColType type;
  TableColumnModel({required this.title, this.type = ColType.Text, this.name});
}

class SortColumnDetailsCustom extends SortColumnDetails {
  const SortColumnDetailsCustom({required super.name, required super.sortDirection});
}
