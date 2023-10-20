class RequestsData {
  final List<int> statusCodesMoc = [200, 201, 202, 203, 204, 400, 404, 500];
  final String getUrl = 'https://jsonplaceholder.typicode.com/posts';
  final String postUrl = 'https://example.com/api/users';
  final payload = {'name': 'John Doe', 'email': 'johndoe@example.com'};
  final headers = {'Content-Type': 'application/json'};
}
