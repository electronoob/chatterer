import 'dart:io';
import 'dart:convert';

void main() {
ServerSocket.bind('0.0.0.0', 6667)
  .then((serverSocket) {
    serverSocket.listen((socket) {
      print("We have a new connection");
print(socket);
      socket.listen(onData);
    });
  });
}

void onData(event) {
	print(utf8.decode(event));
}
