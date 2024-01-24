import 'package:first_episode/src/src.dart';

Future<returnT> futureCall<returnT>({
  required Future<returnT> Function() apiCall,
  required FirstEpisodeException Function(String errorMessage) exception,
}) async {
  try {
    return apiCall();
  } catch (error) {
    throw exception(error.toString());
  }
}
