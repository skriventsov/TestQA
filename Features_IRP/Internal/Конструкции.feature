﻿#language: ru

@tree

Функционал: Конструкции

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка
* Проверка видимости
	Если элемент формы с именем "Company" отсутствует на форме Тогда
		И я нажимаю кнопку выбора у поля с именем "Company"
	И я нажимаю кнопку выбора у поля с именем "PriceType"
	
