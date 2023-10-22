import '../entities/zipecode_entity.dart';
import '../repositories/back4app_repository.dart';

class BackFourAppService {
  BackFourAppRepository backFourAppRepository = BackFourAppRepository();

  saveZipecode(ZipecodeEntity zipecodeEntity) {
    return backFourAppRepository.create(zipecodeEntity);
  }

  getAllZipecode() {
    return backFourAppRepository.fetchAll();
  }

  upadateZipecode(ZipecodeEntity zipecodeEntity) {
    return backFourAppRepository.update(zipecodeEntity);
  }

  deleteZipecode(String id) {
    return backFourAppRepository.delete(id);
  }
}
