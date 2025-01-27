import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> columns = <String>[
  'Description',
  'Opening balance',
  'Incomes',
  'Expenses',
  'Current balance',
  'Foreseen balance',
  'Options',
];

class Account {
  const Account(
    this.description,
    this.openingBalance,
    this.incomes,
    this.expenses,
    this.currentBalance,
    this.foreseenBalance,
  );

  final String description;
  final double openingBalance;
  final double incomes;
  final double expenses;
  final double currentBalance;
  final double foreseenBalance;
}

const List<Account> accounts = <Account>[
  Account('Nubank', 51.55, 914.64, 1990.77, 51.55, 1024.58),
  Account('Mercado Pago', 51.55, 914.64, 1990.77, 51.55, 1024.58),
  Account('Inter', 51.55, 914.64, 1990.77, 51.55, 1024.58),
  Account('Banco do Brasil', 51.55, 914.64, 1990.77, 51.55, 1024.58),
];

class AccountsList extends StatefulWidget {
  const AccountsList({super.key});

  @override
  State<AccountsList> createState() => _AccountsListState();
}

class _AccountsListState extends State<AccountsList> {
  TextStyle cellStyle = TextStyle(color: Colors.black);

  final currency = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: const Color(0xFFCFCFCF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: DataTable(
              columnSpacing: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xE6FFFFFF),
                border: Border.all(
                  color: Colors.grey.withAlpha(90),
                ),
              ),
              // set heading row height 60
              headingRowHeight: 60,
              headingRowColor: WidgetStateProperty.all<Color>(Colors.transparent),
              columns: columns.map(
                (String column) {
                  return DataColumn(
                    label: Text(
                      column,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xF2979797),
                      ),
                      softWrap: true,
                    ),
                  );
                },
              ).toList(),
              rows: accounts.map(
                (Account account) {
                  return DataRow(cells: [
                    DataCell(
                      Text(
                        account.description,
                        style: cellStyle,
                      ),
                    ),
                    DataCell(
                      Text(
                        currency.format(account.openingBalance),
                        style: cellStyle,
                      ),
                    ),
                    DataCell(
                      Text(
                        currency.format(account.incomes),
                        style: cellStyle,
                      ),
                    ),
                    DataCell(
                      Text(
                        currency.format(account.expenses),
                        style: cellStyle,
                      ),
                    ),
                    DataCell(
                      Text(
                        currency.format(account.currentBalance),
                        style: cellStyle,
                      ),
                    ),
                    DataCell(
                      Text(
                        currency.format(account.foreseenBalance),
                        style: cellStyle,
                      ),
                    ),
                    DataCell(
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert_outlined),
                      ),
                    ),
                  ]);
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
