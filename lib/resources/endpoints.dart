class EndPoints{
  static const String baseUrl = 'http://172.16.1.75:9001/api';
  static const String authEnd = '$baseUrl/Auth';
  static const String areaEnd = '$baseUrl/Area';
  static const String departmentEnd = '$baseUrl/Department';
  static const String departmentAreaEnd = '$baseUrl/DepartmentArea';
  static const String deviceEnd = '$baseUrl/Device';
  static const String employeeEnd = '$baseUrl/Employee';
  static const String graphicBrandEnd = '$baseUrl/GraphicsCardBrand';
  static const String graphicModelEnd = '$baseUrl/GraphicsCardModel';
  static const String hardDriveTypeEnd = '$baseUrl/HardDriveType';
  static const String pcModelEnd = '$baseUrl/PcModel';
  static const String processorBrandEnd = '$baseUrl/PcProcessorBrand';
  static const String processorCoreEnd = '$baseUrl/PcProcessorCore';
  static const String processorGenEnd = '$baseUrl/PcProcessorGeneration';
  static const String ramTypeEnd = '$baseUrl/PcRamType';
  static const String screenTypeEnd = '$baseUrl/PcScreenType';
  static const String printerEnd = '$baseUrl/Printer';
  static const String screenEnd = '$baseUrl/Screen';
  static const String screenDeviceEnd = '$baseUrl/ScreenDevice';
  static const String sectorEnd = '$baseUrl/Sector';

  static const String authenticate = '$authEnd/Authenticate';
  static const String createEmployee = '$authEnd/CreateEmployee';

  static const String createSector = '$sectorEnd/CreateSector';
  static const String updateSector = '$sectorEnd/UpdateSector';
  static const String getSectorById = '$sectorEnd/GetSectorById';
  static const String getAllSectors = '$sectorEnd/GetAllSectors';

  static const String createArea = '$areaEnd/CreateArea';
  static const String updateArea = '$areaEnd/UpdateArea';
  static const String getAreaById = '$areaEnd/GetAreaById';
  static const String getAllAreas = '$areaEnd/GetAllAreas';
  static const String getAreaBySectorId = '$areaEnd/GetAllAreasBySectorId';

  static const String createDepartment = '$departmentEnd/CreateDepartment';
  static const String updateDepartment = '$departmentEnd/UpdateDepartment';
  static const String getDepartmentById = '$departmentEnd/GetDepartmentById';
  static const String getAllDepartments = '$departmentEnd/GetAllDepartments';
  static const String getDepartmentBySectorId = '$departmentEnd/GetAllDepartmentsBySectorId';

  static const String createDepartmentArea = '$departmentAreaEnd/CreateDepartmentArea';
  static const String updateDepartmentArea = '$departmentAreaEnd/UpdateDepartmentArea';
  static const String getDepartmentAreaById = '$departmentAreaEnd/GetDepartmentAreaById';
  static const String getAllDepartmentAreas = '$departmentAreaEnd/GetAllDepartmentAreas';

  static const String createDevice = '$deviceEnd/AddDevice';
  static const String updateDevice = '$deviceEnd/UpdateDevice';
  static const String deleteDevice = '$deviceEnd/DeleteDeviceAsync';
  static const String getAllDevices = '$deviceEnd/GetAllDevices';
  static const String getDeviceById = '$deviceEnd/GetDeviceById';
  static const String getDeviceBySerialNumber = '$deviceEnd/GetDeviceBySerialNumber';

  static const String activeEmployee = '$employeeEnd/ActiveEmployeeAccount';
  static const String deActiveEmployee = '$employeeEnd/DeactiveEmployeeAccount';
  static const String getEmployeeById = '$employeeEnd/GetEmployee';
  static const String getAllEmployees = '$employeeEnd/GetEmployees';
  static const String getMyInfo = '$employeeEnd/GetMyInfo';

  static const String createGraphicBrand = '$graphicBrandEnd/AddGraphicsCardBrand';
  static const String updateGraphicsCardBrand = '$graphicBrandEnd/UpdateGraphicsCardBrand';
  static const String deleteGraphicsCardBrand = '$graphicBrandEnd/DeleteGraphicsCardBrandAsync';
  static const String getGraphicBrandById = '$graphicBrandEnd/GetGraphicsCardBrandById';
  static const String getAllGraphicBrands = '$graphicBrandEnd/GetAllGraphicsCardBrands';

  static const String createGraphicModel = '$graphicModelEnd/AddGraphicsCardModel';
  static const String updateGraphicsCardModel = '$graphicModelEnd/UpdateGraphicsCardModel';
  static const String deleteGraphicsCardModel = '$graphicModelEnd/DeleteGraphicsCardModelAsync';
  static const String getGraphicModelById = '$graphicModelEnd/GetGraphicsCardModelById';
  static const String getAllGraphicModels = '$graphicModelEnd/GetAllGraphicsCardModels';
  static const String getGraphicModelsByBrandId = '$graphicModelEnd/GetGraphicsCardModelByBrandId';

  static const String createHardType = '$hardDriveTypeEnd/AddHardDriveTypeAsync';
  static const String updateHardType = '$hardDriveTypeEnd/UpdateHardDriveTypeAsync';
  static const String deleteHardType = '$hardDriveTypeEnd/DeleteHardDriveTypeAsync';
  static const String getHardTypeById = '$hardDriveTypeEnd/GetHardDriveTypeById';
  static const String getAllHardTypes = '$hardDriveTypeEnd/GetAllHardDriveTypes';

  static const String createPcModel = '$pcModelEnd/AddPcModel';
  static const String updatePcModel = '$pcModelEnd/UpdatePcModel';
  static const String deletePcModel = '$pcModelEnd/DeletePcModelAsync';
  static const String getPcModelById = '$pcModelEnd/GetPcModelById';
  static const String getAllPcModels = '$pcModelEnd/GetAllPcModels';

  static const String createProcessorBrand = '$processorBrandEnd/AddPcProcessorBrand';
  static const String updateProcessorBrand = '$processorBrandEnd/UpdatePcProcessorBrand';
  static const String deleteProcessorBrand = '$processorBrandEnd/DeletePcProcessorBrandAsync';
  static const String getProcessorBrandById = '$processorBrandEnd/GetPcProcessorBrandById';
  static const String getAllProcessorBrands = '$processorBrandEnd/GetAllPcProcessorBrands';

  static const String createProcessorCore = '$processorCoreEnd/AddPcProcessorCore';
  static const String updateProcessorCore = '$processorCoreEnd/UpdatePcProcessorCore';
  static const String deleteProcessorCore = '$processorCoreEnd/DeletePcProcessorCore';
  static const String getProcessorCoreById = '$processorCoreEnd/GetPcProcessorCoreById';
  static const String getProcessorCoreByBrandId = '$processorCoreEnd/GetPcProcessorCoreByBrandId';
  static const String getAllProcessorCores = '$processorCoreEnd/GetAllPcProcessorCores';

  static const String createProcessorGen = '$processorGenEnd/AddPcProcessorGeneration';
  static const String updateProcessorGen = '$processorGenEnd/UpdatePcProcessorGeneration';
  static const String deleteProcessorGen = '$processorGenEnd/DeletePcProcessorGenerationAsync';
  static const String getProcessorGenById = '$processorGenEnd/GetPcProcessorGenerationById';
  static const String getProcessorGenByCoreId = '$processorGenEnd/GetAllPcProcessorGenerationByCoreId';
  static const String getAllProcessorGens = '$processorGenEnd/GetAllPcProcessorGenerations';

  static const String createRamType = '$ramTypeEnd/AddPcRamType';
  static const String updateRamType = '$ramTypeEnd/UpdatePcRamType';
  static const String deleteRamType = '$ramTypeEnd/DeletePcRamTypeAsync';
  static const String getRamTypeById = '$ramTypeEnd/GetPcRamTypeById';
  static const String getAllRamTypes = '$ramTypeEnd/GetAllPcRamTypes';

  static const String createScreenType = '$screenTypeEnd/AddPcScreenType';
  static const String updateScreenType = '$screenTypeEnd/UpdatePcScreenType';
  static const String deleteScreenType = '$screenTypeEnd/DeletePcScreenType';
  static const String getScreenTypeById = '$screenTypeEnd/GetPcScreenTypeById';
  static const String getAllScreenTypes = '$screenTypeEnd/GetAllPcScreenTypes';

  static const String createPrinter = '$printerEnd/AddPrinter';
  static const String updatePrinter = '$printerEnd/UpdatePrinter';
  static const String deletePrinter = '$printerEnd/DeletePrinter';
  static const String getPrinterById = '$printerEnd/GetPrinterById';
  static const String getPrinterBySerialNumber = '$printerEnd/GetPrinterBySerialNumber';
  static const String getAllPrinters = '$printerEnd/GetAllPrinters';

  static const String createScreen = '$screenEnd/AddScreen';
  static const String updateScreen = '$screenEnd/UpdateScreen';
  static const String deleteScreen = '$screenEnd/DeleteScreenAsync';
  static const String getScreenById = '$screenEnd/GetScreenById';
  static const String getScreenBySerialNumber = '$screenEnd/GetScreenBySerialNumber';
  static const String getAllScreens = '$screenEnd/GetAllScreens';

  static const String assignScreenToDevice = '$screenDeviceEnd/AssignedToDevices';
  static const String unAssignScreenToDevice = '$screenDeviceEnd/UnAssignedToDevices';
  static const String getAssignedToDeviceById = '$screenDeviceEnd/GetScreenAssignedToDevicesById';
  static const String getAllScreenAssignedToDevices = '$screenDeviceEnd/GetAllScreenAssignedToDevices';

}