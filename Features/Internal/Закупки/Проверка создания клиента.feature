﻿#language: ru

@tree

Функционал: Проверка создания клиента

Как Оператор я хочу
создать клиента 
чтобы вести клиентскую базу

Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка создания клиента
* Открытие формы создания клиента
	И В командном интерфейсе я выбираю 'Продажи' 'Контрагенты'
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСоздать'	
* Заполнение наименования
	И в поле с именем 'Наименование' я ввожу текст 'Тестовый контрагент'
* Заполнение телефона
	И в поле с именем 'Телефон' я ввожу текст '1111111'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Закупочная'
* Сохранение
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля "Код" как "Код"	
	И Я закрываю окно 'Тестовый контрагент (Контрагент)'		
* Проверка сохранения по коду
	Тогда таблица "Список" содержит строки:
		| 'Код'       |
		| '$Код$' |
		
	
		
	