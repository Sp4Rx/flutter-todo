abstract class RepoImp {
  Future<void> init();
  void setData(String key, String data);
  String? getData(String key);
}
