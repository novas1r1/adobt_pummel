import 'package:adopt_pummel/datasources/memory_pet_datasource.dart';
import 'package:adopt_pummel/datasources/pet_datasource.dart';
import 'package:dart_frog/dart_frog.dart';

final _dataSource = MemoryPetDataSource();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<PetDataSource>((_) => _dataSource));
}
