part of 'product_category_bloc.dart';

sealed class ProductCategoryState extends Equatable {
  const ProductCategoryState();
  
  @override
  List<Object> get props => [];
}

final class ProductCategoryInitial extends ProductCategoryState {}

final class ProductCategoryLoading extends ProductCategoryState {}

final class ProductCategoryLoaded extends ProductCategoryState {
  final List<ProductCategoryModel> productCategories;

  const ProductCategoryLoaded(this.productCategories);

  @override
  List<Object> get props => [productCategories];
}

final class ProductCategoryError extends ProductCategoryState {
  final String message;

  const ProductCategoryError(this.message);

  @override
  List<Object> get props => [message];
}