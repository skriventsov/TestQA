﻿#language: ru

@tree

Функционал: Работа с формой документа Расход товара

Как тестировщик я хочу
корректную работу формы документа Расход товара
чтобы не допустить ошибок

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	
Сценарий: Работа с формой документа Расход товара
	* Подготовка
		И Загрузка Организации
		И Загрузка Контрагенты
		И Загрузка Склады
		И Загрузка ВидыЦен
		И Загрузка Валюты
		И Загрузка Товары
		И Загрузка Цены товаров
	* Открытие формы
		И я закрываю все окна клиентского приложения		
		И Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
		И я нажимаю на кнопку с именем 'ФормаСоздать'						
	* Сохранение значений
		И я нажимаю кнопку выбора у поля с именем "Дата"
		И в поле с именем 'Дата' я ввожу текст '08.05.2024  0:00:00'
		И из выпадающего списка с именем "Организация" я выбираю по строке 'ООО "Все для дома"'
		И из выпадающего списка с именем "Покупатель" я выбираю по строке 'Корнет ЗАО'
		И из выпадающего списка с именем "Склад" я выбираю по строке 'Большой'
		И из выпадающего списка с именем "ВидЦен" я выбираю по строке 'Мелкооптовая'
		И из выпадающего списка с именем "Валюта" я выбираю по строке 'EUR'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Veko345MO'
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2 000,00'
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2,00'
		И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
		И в таблице "Товары" в поле с именем 'ТоварыСумма' я ввожу текст '10 000,00'
		И в таблице "Товары" я завершаю редактирование строки
		И я перехожу к закладке с именем "Прочее"
		И в поле с именем 'ОбоснованиеОтгрузки' я ввожу текст 'тест'
		И я перехожу к закладке с именем "ГруппаТовары"		
		Тогда элемент формы с именем "Валюта" стал равен 'EUR'
		И элемент формы с именем "ВидЦен" стал равен 'Мелкооптовая'
		И элемент формы с именем "Дата" стал равен '08.05.2024  0:00:00'
		И у элемента формы с именем "Дата" текст редактирования стал равен '08.05.2024  0:00:00'
		И элемент формы с именем "ОбоснованиеОтгрузки" стал равен 'тест'
		И элемент формы с именем "Организация" стал равен 'ООО \"Все для дома\"'
		И элемент формы с именем "Покупатель" стал равен 'Корнет ЗАО'
		И элемент формы с именем "Склад" стал равен 'Большой'
		И таблица "Товары" стала равной:
			| 'N' | 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'     |
			| '1' | 'Veko345MO' | '2 000,00' | '2,00'       | '10 000,00' |
	* Проверка поведения при изменении поля Организация
		И из выпадающего списка с именем "Организация" я выбираю по строке 'ООО "1000 мелочей"'
		И элемент формы с именем "Валюта" существует и невидим на форме		
		И из выпадающего списка с именем "Организация" я выбираю по строке 'ООО "Все для дома"'
		И элемент "Валюта взиморасчетов" доступен не только для просмотра
	* Проверка поведения при изменении поля Покупатель
		И из выпадающего списка с именем "Покупатель" я выбираю по строке 'ЭлектроБыт ЗАО'
		И элемент формы с именем "ВидЦен" стал равен 'Розничная'
		И таблица "Товары" стала равной:
			| 'N' | 'Товар'     | 'Цена'      | 'Количество' | 'Сумма'     |
			| '1' | 'Veko345MO' | '20 000,00' | '2,00'       | '40 000,00' |
	* Проверка поведения при изменении поля Вид цен
		И из выпадающего списка с именем "ВидЦен" я выбираю по строке 'Мелкооптовая'
		Тогда таблица "Товары" стала равной:
			| 'N' | 'Товар'     | 'Цена'      | 'Количество' | 'Сумма'     |
			| '1' | 'Veko345MO' | '17 500,00' | '2,00'       | '35 000,00' |
	* Проверка поведения при изменении полей Цена и Количество
		И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
		И в таблице "Товары" я выбираю текущую строку
		И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '20 000,00'
		И в таблице "Товары" я завершаю редактирование строки
		Тогда таблица "Товары" стала равной:
			| 'N' | 'Товар'     | 'Цена'      | 'Количество' | 'Сумма'     |
			| '1' | 'Veko345MO' | '20 000,00' | '2,00'       | '40 000,00' |
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" я выбираю текущую строку
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5,00'
		И в таблице "Товары" я завершаю редактирование строки
		Тогда таблица "Товары" стала равной:
			| 'N' | 'Товар'     | 'Цена'      | 'Количество' | 'Сумма'      |
			| '1' | 'Veko345MO' | '20 000,00' | '5,00'       | '100 000,00' |
	* Проверка подбора
		И в таблице "Товары" я нажимаю на кнопку с именем 'КомандаПодбор'
		Тогда открылось окно 'Подбор товара'
		И в таблице "СписокТоваров" я перехожу к строке:
			| 'Код'       | 'Наименование'  |
			| '000000012' | 'Электротовары' |
		И в таблице  "СписокТоваров" я перехожу на один уровень вниз
		И в таблице  "СписокТоваров" я перехожу на один уровень вниз
		И в таблице "СписокТоваров" я перехожу к строке:
			| 'Код'       | 'Наименование' | 'Цена'     |
			| '000000034' | 'Veko876N'     | '6 000,00' |
		И в таблице "СписокТоваров" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'ОК'
		Тогда таблица "Товары" стала равной:
			| 'N' | 'Товар'     | 'Цена'      | 'Количество' | 'Сумма'      |
			| '1' | 'Veko345MO' | '20 000,00' | '5,00'       | '100 000,00' |
			| '2' | 'Veko876N'  | '6 000,00'  | '1,00'       | '6 000,00'   |				
	* Проверка итогового количества и суммы	
		Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '6'
		И элемент формы с именем "ТоварыИтогСумма" стал равен '106 000'
	* Проверка записи
		И я нажимаю на кнопку с именем 'ФормаЗаписать'		
	* Проверка проведения с контролем остатков
		Когда открылось окно 'Продажа * от *'
		И я нажимаю на кнопку с именем 'ФормаПровести'
		И я нажимаю на кнопку с именем 'OK'		
		Тогда в логе сообщений TestClient есть строки:
			| 'Не хватает 5 единиц товара"Veko345MO" на складе"Большой".Максимальное количество: 0.' |
			| 'Не хватает 1 единиц товара"Veko876N" на складе"Большой".Максимальное количество: 0.'  |
		И в таблице 'Товары' я перехожу к первой строке
		И я выбираю пункт контекстного меню с именем 'ТоварыКонтекстноеМенюУдалить' на элементе формы с именем "Товары"		
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю по строке 'Ботинки'
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,00'
		И в таблице "Товары" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаПровести'
	* Проверка печатной формы
		И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'		
		Тогда Табличный документ "SpreadsheetDocument" равен макету "РасходТовараРасходнаяНакладная" по шаблону
		И я закрываю текущее окно
	* Проверка движений
		Когда открылось окно 'Продажа * от *'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
		Тогда таблица "Список" стала равной по шаблону:
			| 'Период' | 'Регистратор' | 'Номер строки' | 'Контрагент'     | 'Сумма'    | 'Валюта' |
			| '*'      | 'Продажа *'   | '1'            | 'ЭлектроБыт ЗАО' | '2 300,00' | 'EUR'    |
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
		Тогда таблица "Список" стала равной по шаблону:
			| 'Период' | 'Регистратор' | 'Номер строки' | 'Покупатель'     | 'Товар'   | 'Количество' | 'Сумма'    |
			| '*'      | 'Продажа *'   | '1'            | 'ЭлектроБыт ЗАО' | 'Ботинки' | '1,00'       | '2 300,00' |			
		И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
		Тогда таблица "Список" стала равной по шаблону:
			| 'Период' | 'Регистратор' | 'Номер строки' | 'Товар'   | 'Склад'   | 'Количество' |
			| '*'      | 'Продажа *'   | '1'            | 'Ботинки' | 'Большой' | '1,00'       |
	* Отмена проведения, пометка на удаление, закрытие
		И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
		И я нажимаю на кнопку с именем 'ФормаОтменаПроведения'
		И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку с именем 'Button0'
		И Я закрываю окно 'Продажа * от *'
				
				
				
				

				
				
				

		
		
		
						
	
		
