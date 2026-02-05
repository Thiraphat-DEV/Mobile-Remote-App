abstract class HomeRemoteDataSource {
  Future<String> getGreeting();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<String> getGreeting() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return 'ยินดีต้อนรับสู่ Hospital App';
  }
}
