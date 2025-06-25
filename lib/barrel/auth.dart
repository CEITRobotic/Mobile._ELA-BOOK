export 'package:ela_book/domain/entities/user.dart';
export 'package:ela_book/domain/usecases/login_user.dart';
export 'package:ela_book/domain/usecases/register_user.dart';
export 'package:ela_book/data/repositories/auth_repository_impl.dart';
export 'package:ela_book/domain/enums/auth_status.dart';


// Example: Login logic part
/*
    import 'package:ela_book/barrel/auth.dart';

    // Get input from controller in page
    final user = User(name: 'janhdo', password: '12345');
    final status = await LoginUser(AuthRepositoryImpl())(user);

    if (status == AuthStatus.success) {
      // Login successfully
    } else {
      // Login failed
    }
*/


// Example: Register logic part
/*
    import 'package:ela_book/barrel/auth.dart';

    // Get input from controller in page
    final user = User(name: 'janhdo', password: '12345', email: 'janhdo1234@gmail.com');
    final status = await RegisterUser(AuthRepositoryImpl())(user);

    if (status == AuthStatus.success) {
      // Register successfully
    } else {
      // Register failed
    }
*/