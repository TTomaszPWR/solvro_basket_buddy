import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvro_basket_buddy/auth/bloc/auth_bloc.dart';
import 'package:solvro_basket_buddy/components/my_button.dart';
import 'package:solvro_basket_buddy/components/my_text_field.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/products/bloc/product_bloc.dart';
import 'package:solvro_basket_buddy/products/model/product_model.dart';
import 'package:solvro_basket_buddy/shopping_lists/bloc/shopping_lists_bloc.dart';
import 'package:solvro_basket_buddy/shopping_lists/components/search_text_field.dart';
import 'package:solvro_basket_buddy/shopping_lists/components/unit_buttons.dart';
import 'package:solvro_basket_buddy/shopping_lists/model/unit.dart';

class SearchItemScreen extends StatefulWidget {
  const SearchItemScreen({super.key});

  @override
  State<SearchItemScreen> createState() => _SearchItemScreenState();
}

class _SearchItemScreenState extends State<SearchItemScreen> {

  TextEditingController searchController = TextEditingController();

  TextEditingController addController = TextEditingController();

  List<ProductModel> _foundProducts = [];

  final List<bool> selections = [true,false,false,false,false];



  @override
  void initState() {
    _foundProducts.addAll(BlocProvider.of<ProductBloc>(context).state.props[0] as List<ProductModel>);
    super.initState();
  }

  void _runFilter(String enteredKeyword){
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

  void _addProductToListOnTap(int listIndex, int productId, String productName, AuthBloc authBloc, ShoppingListsBloc shoppingListsBloc){
    if(addController.text.isNotEmpty && double.tryParse(addController.text) != null){
      if(double.parse(addController.text) > 0){
        Navigator.pop(context);
        shoppingListsBloc.add(AddShoppingItem(
          authBloc.state.props[0] as TokenModel,
          shoppingListsBloc.state.shoppingLists[listIndex].id,
          productId,
          double.parse(addController.text),
          Unit.values[selections.indexOf(true)]
        ));
      }
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Podaj poprawną ilość'),
          backgroundColor: Colors.red,
        )
      );
    }
  }

  void _addProductToList(int listIndex, int productId, String productName, AuthBloc authBloc, ShoppingListsBloc shoppingListsBloc) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.grey[300],
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: [Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Column(
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800]
                    ),
                  ),
          
                  const SizedBox(height: 20,),
          
                  MyTextField(controller: addController, hintText: 'Ilość',),
          
                  const SizedBox(height: 20,),
          
                  UnitButtons(selections: selections),
          
                  const SizedBox(height: 20,),
          
          
                  MyButton(
                    text: 'Dodaj',
                    onTap:() => _addProductToListOnTap(listIndex, productId, productName, authBloc, shoppingListsBloc)
                  ),
                ],
              ),
            ),]
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final shoppingListsBloc = BlocProvider.of<ShoppingListsBloc>(context);
    final listIndex = ModalRoute.of(context)!.settings.arguments as int;


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
                    controller: searchController,
                    onChanged: (value) => _runFilter(value),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: _foundProducts.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final ProductModel product = _foundProducts[index];
                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text(product.category.name),
                        onTap:() => _addProductToList(listIndex, product.id, product.name, authBloc, shoppingListsBloc),
                        trailing: Image.asset('assets/images/${product.category.id}_product_category.png'),
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