import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'food_view_model.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  Future<void> _initial() async {
    final viewModel = context.read<FoodViewModel>();
    await viewModel.getFoods();
  }

  @override
  void initState() {
    super.initState();
    _initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Foods'),
      ),
      body: _body(context.watch<FoodViewModel>()),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart),
        label: const Text('Pay'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(14),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(FoodViewModel viewModel) {
    switch (viewModel.state) {
      case FoodViewModelState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case FoodViewModelState.none:
        return _renderListMenu(viewModel);
      case FoodViewModelState.error:
        return const Center(
          child: Text('Gagal Mendapatkan Menu'),
        );
    }
  }

  Widget _renderListMenu(FoodViewModel viewModel) {
    return ListView.separated(
      padding: const EdgeInsets.all(14),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final food = viewModel.foods.elementAt(index);
        return ListTile(
          leading: SvgPicture.network(
            'https://www.svgrepo.com/show/103223/fast-food.svg',
            width: 50,
            height: 50,
          ),
          minLeadingWidth: 50,
          title: Row(
            children: [
              Text(food.name),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  food.quantity.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          contentPadding: const EdgeInsets.all(14),
          subtitle: const Text("\$5.4"),
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          trailing: Column(
            children: [
              SizedBox(
                width: 25,
                height: 25,
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<FoodViewModel>()
                        .setQuantity(food.id, food.quantity + 1);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 25,
                height: 25,
                child: ElevatedButton(
                  onPressed: () {
                    if (food.quantity > 0) {
                      context
                          .read<FoodViewModel>()
                          .setQuantity(food.id, food.quantity - 1);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: viewModel.foods.length,
    );
  }
}
