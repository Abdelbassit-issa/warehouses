import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouses/constants/emuns.dart';
import 'package:warehouses/controllers/dash_board/cubit/dash_board_cubit.dart';
import 'package:warehouses/view/warehouse_dash_board/widgets/sec_info.dart';
import 'package:warehouses/widgets/prograss_indecator.dart';

import '../../data/parts.dart';

class WarehouseDashBoard extends StatefulWidget {
  const WarehouseDashBoard({super.key});

  @override
  State<WarehouseDashBoard> createState() => _WarehouseDashBoardState();
}

class _WarehouseDashBoardState extends State<WarehouseDashBoard> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              controller: searchController,
              onChanged:
                  (value) => context.read<DashBoardCubit>().searchData(
                    searchTrime: value,
                  ),
              cursorColor: Colors.blueGrey.shade600,
              cursorWidth: 5,
              cursorRadius: const Radius.circular(1),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: Colors.blueGrey.shade600,
                ),
                hintText: 'بحث...',
                suffixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.blueGrey.shade600,
                  size: 21,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(13),
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: BlocBuilder<DashBoardCubit, DashBoardState>(
                      builder: (context, state) {
                        return state.status == DashboardStatus.loading
                            ? progressIndicator()
                            : GridView.extent(
                              maxCrossAxisExtent: 200.0,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              padding: EdgeInsets.all(8.0),
                              children:
                                  state.items.map((item) {
                                    return GestureDetector(
                                      onTap:
                                          () => showDialog(
                                            context: context,
                                            builder:
                                                (context) => Center(
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.width /
                                                        2,
                                                    height:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.height ,
                                               
                                                    child: secInfoDialog(
                                                      sec: item,
                                                      secName: state.sec,
                                                    ),
                                                  ),
                                                ),
                                          ),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        color: Colors.blueGrey.shade900,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              item['name'],
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              textDirection: TextDirection.rtl,

                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 233,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.blueGrey.shade800,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 89,
                          width: 233,
                          child: Card(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: parts.length,
                            itemBuilder: (context, index) {
                              final part = parts[index];
                              return SizedBox(
                                width: 233,
                                child: GestureDetector(
                                  onTap:
                                      () => context
                                          .read<DashBoardCubit>()
                                          .getDataItems(index: index),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    color: Colors.blueGrey.shade100,

                                    child: Text(
                                      part,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey.shade800,
                                      ),

                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      strutStyle: StrutStyle(leading: 2),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
