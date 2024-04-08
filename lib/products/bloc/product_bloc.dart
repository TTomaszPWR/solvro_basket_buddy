import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/products/model/product_model.dart';
import 'package:solvro_basket_buddy/products/repo/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  
  ProductBloc(this._productRepository) : super(ProductInitial())  {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try{
        List<ProductModel> products =  await _productRepository.fetch(event.token);
        emit(ProductLoaded(products));
      }catch(e){
        emit(ProductError(e.toString()));
      }

    });
  }
}
