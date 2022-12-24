//macro "Начало работы []" {
    //close(); // закрываем все открытые изображения
    // загрузка изображения (файла) из выбранной директории – как это сделать??
	path = File.openDialog("Select a File");
		directoryPath = File.getParent(path);
		filename = File.getName(path);
		File.setDefaultDir(directoryPath);
	open(filename);
    getPixelSize(unit, pixelWidth, pixelHeight); // узнаем параметры пикселя  
	pw = pixelWidth/10; // переводим значение из мм в см
	run("Set Scale...", "distance=1 known=pw pixel=1 unit=cm"); // устанавливаем новую шкалу
	run("Duplicate...", " "); // создаем копию изображения
	setTool("Paintbrush Tool"); // устанавливаем белую кисть
	roiManager("Delete"); // очищаем ROI Manager
	// Думаю надо еще вот это добавить:
	run("Set Measurements...", "area mean standard min perimeter shape area_fraction display redirect=None decimal=3");

//	}


