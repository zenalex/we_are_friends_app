import 'package:flutter/material.dart';
import 'package:nsg_data/nsg_data.dart';

class LoginParams extends NsgPhoneLoginParams {
  LoginParams()
      : super(
            cardColor: Colors.grey[100],
            buttonSize: 32,
            //headerMessage: 'ТИТАН 112',
            headerMessageVisible: false,
            headerMessageVerification: 'Введите проверочный код',
            descriptionMessegeVerification:
                'Мы отправили вам код в СМС\nна телефонный номер\n{{phone}}',
            textEnterPhone: 'Введите номер телефона',
            textResendSms: 'Назад',
            textSendSms: 'Отправить код',
            textEnterCaptcha: 'Введите текст',
            textLoginSuccessful: 'Успешная авторизация',
            textEnterCorrectPhone: 'Введите правильный телефон',
            textCheckInternet: 'Проверьте интернет соединение',
            appbar: false,
            useCaptcha: false);

  @override
  String errorMessage(int statusCode) {
    String message;
    switch (statusCode) {
      case 40101:
        message = 'Необходимо получить капчу';
        break;
      case 40102:
        message = 'Капча устарела. Попробуйте снова!';
        break;
      case 40103:
        message = 'Неправильный текст капчи. Попробуйте снова!';
        break;
      case 40104:
        message = 'Введите номер телефона!';
        break;
      case 40105:
        message = 'Введите текст капчи!';
        break;
      case 40300:
        message = 'Проверочный код неправильный. Попробуйте снова!';
        break;
      case 40301:
        message = 'Слишком много попыток ввода кода. Попробуйте снова!';
        break;
      case 40302:
        message = 'Код безопасности устарел';
        break;
      case 40303:
        message = 'Необходимо ввести код подтверждения';
        break;
      default:
        message = statusCode == 0 ? '' : 'Произошла ошибка $statusCode';
    }
    return message;
  }
}
