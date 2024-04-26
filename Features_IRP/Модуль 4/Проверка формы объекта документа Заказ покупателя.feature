﻿#language: ru

@tree

Функционал: Проверка формы объекта документа Заказ покупателя 

Как Тестировщик я хочу
правильное поведение элементов формы объекта документа Заказ покупателя
чтобы не было ошибок

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовка
	И Экспорт основных данных

Сценарий: Заполнение Партнер, Соглашение, Контрагент, если не выбран Партнер
	* Открытие, подготовка формы
		И я закрываю все окна клиентского приложения
		И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		И я нажимаю на кнопку с именем 'FormCreate'				
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'            |
			| 'Клиент 2 (2 соглашения)' |
		И я нажимаю на кнопку с именем 'FormChoose'
		И я нажимаю кнопку выбора у поля с именем "LegalName"
		И в таблице "List" я перехожу к строке:
			| 'Наименование' |
			| 'Клиент 2'     |
		И я нажимаю на кнопку с именем 'FormChoose'
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		И в таблице "List" я перехожу к строке:
			| 'Наименование'                                        |
			| 'Индивидуальное соглашение 1 (расчет по соглашениям)' |		
		И я нажимаю на кнопку с именем 'FormChoose'
	* Проверка заполнения
		Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
		Тогда элемент формы с именем "LegalName" стал равен 'Клиент 2'
		Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 1 (расчет по соглашениям)'
	* Очистка партнера, проверка доступности Контрагент
		И я нажимаю кнопку очистить у поля с именем "Partner"
		И элемент формы "Контрагент" не доступен