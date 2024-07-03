import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Models/table_row_model.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TablePartial extends StatefulWidget {
  final List<TableColumnModel> columns;
  final List<TableRowModel> rows;
  final Function(List<DataGridCell> cells)? onRowClick;
  final bool search;
  final ColumnWidthMode? columnWidthMode;
  final int? selectedRow;

  const TablePartial({
    super.key,
    required this.columns,
    required this.rows,
    this.onRowClick,
    this.search = false,
    this.selectedRow,
    this.columnWidthMode,
  });

  @override
  State<TablePartial> createState() => _TablePartialState();
}

List<TableRowModel> employees = [];
const int rowsPerPage = 10000;

class _TablePartialState extends State<TablePartial> {
  late EmployeeDataSource source;
  final controller = DataGridController();
  final pageController = DataPagerController();

  double pageCount = 0;

  initState() {
    employees = widget.rows;
    source = EmployeeDataSource(
      rowList: widget.rows,
      columns: widget.columns,
    );
    pageCount = widget.rows.length / rowsPerPage;
    if (pageCount < 1) {
      pageCount = 1;
    }
    super.initState();
  }

  List<GridColumn> columnGenerate() {
    List<GridColumn> list = [];
    for (var el in widget.columns) {
      list.add(
        GridColumn(
          columnName: el.title,
          label: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerRight,
            child: Text(el.title),
          ),
        ),
      );
    }
    return list;
  }

  var selectionManager = RowSelectionManager();

  @override
  Widget build(BuildContext context) {
    return SfDataGridTheme(
      data: SfDataGridThemeData(
        filterPopupTextStyle: GoogleFonts.quicksand(),
      ),
      child: Column(
        children: [
          Expanded(
            child: SfDataGrid(
              controller: controller,
              allowSorting: true,
              allowFiltering: true,
              allowColumnsResizing: true,
              allowColumnsDragging: true,
              columnWidthMode:
                  widget.columnWidthMode ?? (context.isPhone ? ColumnWidthMode.fitByColumnName : ColumnWidthMode.fill),
              //rowsPerPage: rowsPerPage,
              isScrollbarAlwaysShown: true,
              showHorizontalScrollbar: true,
              showVerticalScrollbar: true,
              showSortNumbers: true,
              selectionManager: selectionManager,
              source: source,
              columns: columnGenerate(),
              onCellTap: (details) {
                if (widget.onRowClick != null) {
                  int index = details.rowColumnIndex.rowIndex - 1;

                  var asd = source.effectiveRows.elementAt(index);
                  widget.onRowClick?.call(asd.getCells());
                }
              },
            ),
          ),
          /*SfDataPager(
            controller: pageController,
            pageCount: pageCount,
            direction: Axis.horizontal,
            delegate: source,
          ),*/
        ],
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  List<TableRowModel> rowList;
  List<TableColumnModel> columns;
  Function(TableRowModel row)? onRowClick;
  EmployeeDataSource({
    required this.rowList,
    required this.columns,
    this.onRowClick,
  }) {
    buildPaginatedDataGridRows();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>(
      (item) {
        TableColumnModel column = columns.firstWhere((element) => element.title == item.columnName);
        if (column.type == ColType.Widget) {
          return item.value;
        }

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: .1,
            ),
          ),
          child: Text(
            item.value.toString(),
            maxLines: 1,
          ),
        );
      },
    ).toList());
  }

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    var column = columns.firstWhere((element) => element.title == sortColumn.name);

    final String? value1 =
        a?.getCells().firstWhereOrNull((element) => element.columnName == sortColumn.name)?.value.toString();
    final String? value2 =
        b?.getCells().firstWhereOrNull((element) => element.columnName == sortColumn.name)?.value.toString();

    if (value1 == null || value2 == null) {
      return 0;
    }

    if (column.type == ColType.Number || column.type == ColType.Double) {
      double num1 = double.tryParse(value1) ?? 0;
      double num2 = double.tryParse(value2) ?? 0;
      if (num1 > num2) {
        return sortColumn.sortDirection == DataGridSortDirection.ascending ? 1 : -1;
      } else if (num1 < num2) {
        return sortColumn.sortDirection == DataGridSortDirection.ascending ? -1 : 1;
      }
    }

    if (column.type == ColType.Date || column.type == ColType.DateTime) {
      DateTime date1 = DateTime.tryParse(value1) ?? DateTime.now();
      DateTime date2 = DateTime.tryParse(value2) ?? DateTime.now();
      if (date1.compareTo(date2) > 0) {
        return sortColumn.sortDirection == DataGridSortDirection.ascending ? 1 : -1;
      } else if (date1.compareTo(date2) < 0) {
        return sortColumn.sortDirection == DataGridSortDirection.ascending ? -1 : 1;
      }
    }

    return super.compare(a, b, sortColumn);
  }

  void buildPaginatedDataGridRows() {
    dataGridRows = employees.map<DataGridRow>(
      (dataGridRow) {
        List<DataGridCell> cells = [];
        int index = 0;
        for (var el in dataGridRow.cells) {
          cells.add(
            DataGridCell(
              columnName: columns[index].title,
              value: el.data ?? "",
            ),
          );
          index++;
        }

        return DataGridRow(cells: cells);
      },
    ).toList(growable: false);
  }
}
