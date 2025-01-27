import 'package:ai_lawyer/src/app/app.dart';
import 'package:ai_lawyer/src/utils/card_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  await CardStorage.saveSampleCardsToPrefs();
  runApp(App());
}

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   ChatScreenState createState() => ChatScreenState();
// }

// class ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   String _response = '';

//   Future<void> _sendMessage() async {
//     final userMessage = _controller.text.trim();
//     if (userMessage.isEmpty) return;

//     setState(() {
//       _response = 'Generating response...';
//     });

//     final result = await OpenAIService.generateChatGPTResponse(userMessage);

//     setState(() {
//       _response = result;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ChatGPT Flutter Demo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // User Prompt Field
//             TextField(
//               controller: _controller,
//               decoration: const InputDecoration(labelText: 'Enter your prompt'),
//             ),
//             const SizedBox(height: 16),

//             // Send Button
//             ElevatedButton(
//               onPressed: _sendMessage,
//               child: const Text('Send'),
//             ),
//             const SizedBox(height: 16),

//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(_response),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
