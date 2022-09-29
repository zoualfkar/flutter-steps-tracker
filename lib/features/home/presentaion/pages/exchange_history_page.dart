import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/common/widget/app_bar_widget.dart';
import 'package:steps_tracker/core/common/widget/error_view.dart';
import 'package:steps_tracker/core/common/widget/loading_view.dart';
import 'package:steps_tracker/features/home/domain/entities/exchange_history_entity.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_exchange_history_cubit.dart';
import 'package:steps_tracker/injections.dart';

class ExchangeHistoryPage extends StatefulWidget {
  const ExchangeHistoryPage({Key? key}) : super(key: key);

  @override
  State<ExchangeHistoryPage> createState() => _ExchangeHistoryPageState();
}

class _ExchangeHistoryPageState extends State<ExchangeHistoryPage> {

  GetExchangeHistoryCubit getExchangeHistoryCubit =serviceLocator<GetExchangeHistoryCubit>();



  @override
  void initState() {
    super.initState();
    getExchangeHistoryCubit.getExchangeHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'exchange_history'.tr(),),
      body: BlocBuilder<GetExchangeHistoryCubit,BaseState<List<ExchangeHistoryEntity>>>(
        bloc:getExchangeHistoryCubit,
        builder: (context, state) {

          if(state.isInProgress) {
            return const  LoadingView();
          } else if(state .isFailure){
            return ErrorView(error: state.failure?.error?.message??'',
                onRefresh: (){
                  getExchangeHistoryCubit.getExchangeHistory();
                });
          }


          return ListView.builder(
              itemCount: state.item!.length,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        '${state.item![index].count}  ${state.item![index].count>1 ? 'points'.tr() :'point'.tr() }',
                      style:  Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle:Text(
                      '${DateFormat('dd-MM-yyyy hh:mm').format(state.item![index].date)}  ',
                      style:  Theme.of(context).textTheme.subtitle2,
                    ) ,
                  ),
                );
          });
        },
      ),
    );
  }
}
