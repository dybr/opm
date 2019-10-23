///////////////////////////////////////////////////////////////////////////////////////////////////
// Прикладной интерфейс

Процедура ОписаниеКоманды(Знач КомандаПриложения) Экспорт
	
	КомандаПриложения.Опция("winCreateBashLauncher", Ложь, "Создавать sh-скрипт запуска для пакетов приложений в среде Windows");
	КомандаПриложения.Опция("proxyusedefault", Ложь, "Использовать ПроксиПоУмолчанию (системные настройки)");
	КомандаПриложения.Опция("proxyserver", "", "Адрес прокси");
	КомандаПриложения.Опция("proxyport", "", "Порт прокси").ТЧисло();
	КомандаПриложения.Опция("proxyuser", "", "Пользователь прокси");
	КомандаПриложения.Опция("proxypass", "", "Пароль прокси");

КонецПроцедуры

// Выполняет логику команды
// 
// Параметры:
//   ПараметрыКоманды - Соответствие ключей командной строки и их значений
//
Процедура ВыполнитьКоманду(Знач КомандаПриложения) Экспорт
	
	ПараметрыКоманды = Новый Соответствие;

	winCreateBashLauncher = КомандаПриложения.ЗначениеОпции("winCreateBashLauncher");

	Если ЗначениеЗаполнено(winCreateBashLauncher) Тогда
		ПараметрыКоманды.Вставить("-winCreateBashLauncher", winCreateBashLauncher);
	КонецЕсли;

	proxyusedefault = КомандаПриложения.ЗначениеОпции("proxyusedefault");

	Если ЗначениеЗаполнено(proxyusedefault) Тогда
		ПараметрыКоманды.Вставить("-proxyusedefault", proxyusedefault);
	КонецЕсли;

	proxyserver = КомандаПриложения.ЗначениеОпции("proxyserver");

	Если ЗначениеЗаполнено(proxyserver) Тогда
		ПараметрыКоманды.Вставить("-proxyserver", proxyserver);
	КонецЕсли;

	proxyport = КомандаПриложения.ЗначениеОпции("proxyport");

	Если ЗначениеЗаполнено(proxyport) Тогда
		ПараметрыКоманды.Вставить("-proxyport", proxyport);
	КонецЕсли;

	proxyuser = КомандаПриложения.ЗначениеОпции("proxyuser");

	Если ЗначениеЗаполнено(proxyuser) Тогда
		ПараметрыКоманды.Вставить("-proxyuser", proxyuser);
	КонецЕсли;

	proxypass = КомандаПриложения.ЗначениеОпции("proxypass");

	Если ЗначениеЗаполнено(proxypass) Тогда
		ПараметрыКоманды.Вставить("-proxypass", proxypass);
	КонецЕсли;
	
	ПараметрыПриложенияOpm.ЗаполнитьНастройкиИзПараметров(ПараметрыКоманды);
    ПараметрыПриложенияOpm.СохранитьТекущиеНастройки();	

КонецПроцедуры