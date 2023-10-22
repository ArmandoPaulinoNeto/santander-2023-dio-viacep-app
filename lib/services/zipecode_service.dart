import '../repositories/zipecode_repository.dart';

class ZipecodeService {
  var type = ["json", "xml"];
  ZipecodeRepository zipecodeRepository = ZipecodeRepository();

  get(String number, int returnType) {
    var address = "$number/${type[returnType]}";
    return zipecodeRepository.getByZipecode(address);
  }
}
