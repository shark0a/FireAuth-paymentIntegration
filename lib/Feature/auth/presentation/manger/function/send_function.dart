import 'package:authtest/core/utils/Common/widget/show_message.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

Future<void> sendCode(String recipient, String subject, String body) async {
  // Use the SMTP server for Gmail
  String username = "shar409511@gmail.com";
  String password =
      "yfcvbwyqggzoihnx"; // Note: Use an app password instead of your actual Gmail password.

  final smtpServer = gmail(username, password);

  // Create the email message
  final message = Message()
    ..from = Address(username, 'FlutterApp')
    ..recipients.add(recipient) // Add recipient email address
    ..subject = subject
    ..text = body;

  try {
    final sendReport = await send(message, smtpServer);
    ShowMessage(message: 'Email sent: $sendReport');
  } on MailerException catch (e) {
    ShowMessage(message: 'Message not sent. $e');
    for (var p in e.problems) {
      ShowMessage(message: 'Problem: ${p.code}: ${p.msg}');
    }
  }
}
