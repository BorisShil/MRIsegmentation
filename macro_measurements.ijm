//macro "" {

//setResult("Исследование", 0, getTitle());

// Устанавливаем то, что нужно измерить и в цикле измеряем все ROIs, кроме общей области интереса

	for (i = 1; i <= 7; i++){
		//run("Fit Spline");     
		roiManager("Select", i);
		run("Set Measurements...", "area perimeter display redirect=None decimal=2");
		//run("Set Measurements...", "area perimeter display redirect=[Z02 copy];
		run("Measure");
		}

// Вводим переменные для общей площади мышц, площади тела позвонка и самого индекса соответственно

	m = 0; v = 0; k = 0;

// В цикле находим общую площадь мышц и записываем в переменную m

	for (r = 0; r <= 5; r++){
		m += getResult("Area", r);
		}

// Создаем переменный для каждого мышечного пучка, чтобы записать в таблицу
				
m1 = getResult("Area", 0);
setResult("Площадь мышечного пучка 1", 0, m1);
m2 = getResult("Area", 1);
setResult("Площадь мышечного пучка 2", 0, m2);
m3 = getResult("Area", 2);
setResult("Площадь мышечного пучка 3", 0, m3);
m4 = getResult("Area", 3);
setResult("Площадь мышечного пучка 4", 0, m4);
m5 = getResult("Area", 4);
setResult("Площадь мышечного пучка 5", 0, m5); 
m6 = getResult("Area", 5);
setResult("Площадь мышечного пучка 6", 0, m6);
// Записываем в таблицу общую площадь мышц
setResult("Общая площадь мышечных пучков", 0, m);

// Записываем в переменную плозадь тела позвонка и также помещаем в таблицу
v = getResult("Area", 6);
setResult("Площадь тела позвонка", 0, v);
k = m/v; // расчет мышечно-позвоночного индекса (МПИ)
setResult("МПИ", 0, k); // запись индекса в таблицу

// Проблема с таблицей: как привести ее к классическому виду (столбцы – параметры, строки – наблюдения)

//name = "[Results]";
//print(name, "\\Clear");
//setResult("Label", 7, "Index") 
//}
//Table.create("Результаты");
//Table.set(getTitle(), , value)