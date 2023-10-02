import 'package:dio/dio.dart';
import 'package:yes_not_app/domain/entities/message.dart';
import 'package:yes_not_app/infrastricture/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    response.data['answer'];

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
