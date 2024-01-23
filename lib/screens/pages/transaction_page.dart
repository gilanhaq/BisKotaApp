import 'package:biskota/cubit/transaction_cubit.dart';
import 'package:biskota/screens/widgets/card_transaction.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text('You dont have transaction yet'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 120),
              child: ListView.builder(
                  itemCount: state.transactions.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  itemBuilder: (context, index) {
                    return TransactionCard(
                      state.transactions[index],
                    );
                  }),
            );
          }
        }

        return Center(
          child: Text(
            'Transaction Page',
            style: blackText.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
        );
      },
    );
  }
}
