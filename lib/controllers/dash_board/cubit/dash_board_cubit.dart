import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:warehouses/repos/vendors_repo.dart';

import '../../../constants/emuns.dart';

part 'dash_board_state.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(DashBoardState.initial());
  void searchData({required String searchTrime}) async {
    try {
      emit(state.copyWith(status: DashboardStatus.loading));
      final sec = await getSection(tableName: state.sec);
      emit(
        state.copyWith(
          items:
              sec!
                  .where(
                    (vendor) => vendor['name'].toLowerCase().contains(
                      searchTrime.toLowerCase().trim(),
                    ),
                  )
                  .toList(),
          status: DashboardStatus.dashboardLoaded,
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void getDataItems({required int index}) async {
    try {
      emit(state.copyWith(status: DashboardStatus.loading));

      switch (index) {
        case 0:
          final sec = await getSection(tableName: 'assets');
          emit(
            state.copyWith(
              items: sec,
              status: DashboardStatus.dashboardLoaded,
              sec: 'assets',
            ),
          );
          break;
        case 1:
          final sec = await getSection(tableName: 'raw_materials');

          emit(
            state.copyWith(
              items: sec,
              status: DashboardStatus.dashboardLoaded,
              sec: 'raw_materials',
            ),
          );
          break;
        case 2:
          emit(state.copyWith(items: []));
          break;
        case 3:
          emit(state.copyWith(items: []));
          break;
        case 4:
          final sec = await getSection(tableName: 'vendors');

          emit(
            state.copyWith(
              items: sec,
              status: DashboardStatus.dashboardLoaded,
              sec: 'vendors',
            ),
          );
          break;
        case 5:
          emit(state.copyWith(items: []));
          break;
        case 6:
          emit(state.copyWith(items: []));
          break;
        default:
          emit(state.copyWith(items: []));
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
