import 'dart:io';
import 'dart:convert';

void main() {
	ServerSocket.bind('0.0.0.0', 6667)
		.then((serverSocket) {
			serverSocket.listen((socket) {
				print("We have a new connection");
				print(socket);
				socket.listen(onData);
				socket.writeln("NOTICE AUTH :*** something something lol lol");
				socket.writeln(":Singapore.SG.AS.Undernet.Org 001 user_ :welcome to irc, user_");
			});
		});
}

void onData(event) {
	String data = utf8.decode(event);
	LineSplitter ls = new LineSplitter();
	List<String> lines = ls.convert(data);
	for (var line in lines) {
		print("-");
		print(line);
		//split line by spaces
		List<String> toks = line.split(' ');
		print(toks);
		if (toks[0] == "NICK") {
			print("NICK REQUEST RECEIVED");
			print(toks.length);
			if(toks.length == 2) { 
				print(toks[1]);
			} else {
				print("incorrect paramaters provided.");
			}
		}

	}
}
