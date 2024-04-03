import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/product_category/model/product_category_model.dart';
import 'package:solvro_basket_buddy/product_category/repo/product_category_repository.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductCategoryRepository _productCategoryRepository;

  ProductCategoryBloc(this._productCategoryRepository) : super(ProductCategoryInitial()) {
    on<FetchProductCategories>((event, emit) {
      emit(ProductCategoryLoading());
      try{
        List<ProductCategoryModel> productCategories = _productCategoryRepository.fetch(event.token) as List<ProductCategoryModel>;
        emit(ProductCategoryLoaded(productCategories));
      }catch(e){
        emit(ProductCategoryError(e.toString()));
      }
    });
  }
}
