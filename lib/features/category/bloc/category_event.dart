abstract class CategoryEvent {}

class CreateCategoryRequested extends CategoryEvent {
  final String name;

  CreateCategoryRequested({required this.name});
}

abstract class GetCategoryRequested extends CategoryEvent {}

class UpdateCategoryRequested extends CategoryEvent {
  final String id;
  final String name;

  UpdateCategoryRequested(this.id, this.name);
}

class DeleteCategoryRequested extends CategoryEvent {
  final String id;

  DeleteCategoryRequested(this.id);
}