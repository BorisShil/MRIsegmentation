//macro "Создание ROIs []"{
  requires("1.37j");
  orig = getImageID();
  setBatchMode(false);
  if (roiManager("Count") < 2)
      exit("Требуется добавление минимум двух областей интереса в ROI Manager");
      
  // добавление общей области интереса в ROI Manager
  
  roiManager("Select", 0);
  run("Create Mask");
  rename("Common ROI");
  common_roi = getImageID();
  roiManager("Rename", "Общая область интереса");
  
  // добавление отдельных областей интереса в ROI Manager
  
      for (i = 1; i <= 7; i++){     
      	roiManager("Select", i);
      	run("Create Mask");
      	//rename("Temporary Mask" + i);
      	temp_mask = getImageID();
      	imageCalculator("AND", temp_mask, common_roi);
      	run("Create Selection");
      	//selectWindow("Mask");
      	//run("Fit Spline"); //error: polygon or polyline required (прерывается на 4 итерации)
      	roiManager("Add");
      	close(); // закрываем все окна с масками для отдельных областей
      	selectImage(orig);
      	roiManager("Select", roiManager("Count") - 1);
      	roiManager("Rename", "Мышечный пучок " + i);    	
      	}
      	
  selectWindow("Common ROI"); // выбираем окно с маской для общей области интереса
  close(); // закрываем окно с маской для общей области интереса
  roiManager("Select", roiManager("Count") - 1);
  roiManager("Rename", "Тело позвонка"); // переименовываем ROI с позвонком
  
  // удаление временных областей интереса по каждой группе мышц и позвонку 
  
      for (n = 1; n <= 7; n++){ // n - число итераций цикла
      	roiManager("Select", 1);
      	roiManager("Delete"); 
      }
      
  // сохраняем области интереса в архив с именем, соответствующим имени файла дайком 
  dir = getDir("Choose a Directory");
  roiManager("Save", dir + getTitle() + ".zip");
  
 // }
  
 //for (i = 0; i <= 7; i++){
 	//roiManager("Select", i);
 	//run("Fit Spline");
 	//}
 //getInfo(DICOM_TAG)!!!!
 //getList("threshold.methods")!!
 //getResult("Column", row)!!
 //saveAs(format, path)
 //roiManager("multi-measure one")
 //roiManager("multi-measure append")
 //roiManager("multi measure")
      	
 