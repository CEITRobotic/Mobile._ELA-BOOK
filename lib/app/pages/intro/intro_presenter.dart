class IntroPresenter {
  // Simulate authentication logic
  Future<String> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    if (username == 'admin' && password == '1234') {
      return 'Login successful';
    } else {
      return 'Invalid credentials';
    }
  }
}

// folder ນີ້ໃຊ້ໃນການຕິດຕໍ່ກັບ firebase SDk
// ຈັດການວ່າເວລາທີ່ເຮົາ login ໄດ້ແລ້ວໄປໃສຕໍ່