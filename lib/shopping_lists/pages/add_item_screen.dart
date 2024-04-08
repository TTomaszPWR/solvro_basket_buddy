import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/products/bloc/product_bloc.dart';
import 'package:solvro_basket_buddy/products/model/product_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/components/search_text_field.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  TextEditingController controller = TextEditingController();

  List<ProductModel> _foundProducts = [];

  @override
  void initState() {
    _foundProducts.addAll(BlocProvider.of<ProductBloc>(context).state.props[0] as List<ProductModel>);
    super.initState();
  }

  void _runFilter(String enteredKeyword){
    print (enteredKeyword);
    List<ProductModel> results = [];
    List<ProductModel> productsList = BlocProvider.of<ProductBloc>(context).state.props[0] as List<ProductModel>;
    if(enteredKeyword.isEmpty){
      results = productsList;
    } else {
      results = productsList.where((product) => product.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundProducts = results;
    });
  }

  void _addProductToList() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        child: Column(
          children: [
            Text('Add product to list'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[300],
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoaded) {
            return Column(
              children: [
                Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: SearchTextField(
                    hintText: 'Search',
                    controller: controller,
                    onChanged: (value) => _runFilter(value),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: _foundProducts.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_foundProducts[index].name),
                        subtitle: Text(_foundProducts[index].category.name),
                        onTap: _addProductToList
                      );
                    }
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}