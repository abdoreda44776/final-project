import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_final_project/helpers/my_styles.dart';
import 'package:iti_final_project/modules/home/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:iti_final_project/modules/home/presentation/ui/widgets/product_list_view_item.dart';
import 'package:iti_final_project/modules/home/presentation/ui/widgets/products_list_view_loading.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ProductListViewItem(
              productModel: state.products[index],
            ),
            itemCount: state.products.length,
          );
        } else if (state is GetProductsFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: MyStyles.font22BlackRegular,
            ),
          );
        } else {
          return const ProductsListViewLoading();
        }
      },
    );
  }
}
