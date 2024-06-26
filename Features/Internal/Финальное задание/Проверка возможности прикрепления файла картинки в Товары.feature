﻿#language: ru

@tree

Функционал: Проверка возможности прикрепления файла картинки в Товары

Как Тестировщик я хочу
проверить возможность прикрепить файл картинки в форме элемента справочника Товары
чтобы избежать ошибок

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка возможности прикрепления файла картинки в Товары
* Подготовка
	И Загрузка Товары
	
* Проверка
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование' | 'Код'       |
		| 'Bosch1234'    | '000000017' |	
	И в таблице "Список" я выбираю текущую строку	
	И я нажимаю кнопку очистить у поля с именем "ФайлКартинки"
	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"	
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	И я выбираю файл '$КаталогПроекта$\Files\itempicture1.png'
	И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'	
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'     |
		| 'itempicture1.png' |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда элемент формы с именем "ФайлКартинки" стал равен 'itempicture1.png'
		

		
		
		
	
