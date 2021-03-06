# encoding: utf-8

 require './user.rb'
 require './usersdb.rb'
 require './sender.rb'


 citiesBase = [
	{
		name: 'Москва'
	},
	{
		name: 'Санкт Петербург'
	},
	{
		name: 'Нижний Новгород'
	}

]

User.setCitiesBase citiesBase

usersBase = Database.new
usersBase.setClassUser(User)



# create

# добавление нового пользователя
usersBase.create 'test'
usersBase.create 'test2'
usersBase.create('Джизос Крайст')


# update (no method)

user4 = usersBase.select('Джизос Крайст')

address4 = user4.getAddress
address4[:street] = 'Сталина'
address4[:homeNumber] = 12
address4[:flatNumber] = 4
emails4 = user4.getEmails
emails4.push 'djisos@ya.ru'
emails4.push 'djisos@gmail.com'

phones4 = user4.getPhones
phones4.push '89161234567'
phones4.push '89031234567'

jab4 = user4.getJabbers
jab4.push 'dji-jabber@gmail.com'
jab4.push 'jabber@yandex.com'

# select

djizos = usersBase.select('Джизос Крайст')
djizos.setCity('Москва')

# вывод

puts 'Адреса: '
puts djizos.getTextAddress
puts 'Адреса (кратко): '
puts djizos.getTextAddress(:short)

# город меняет название одной строчкой
citiesBase[0][:name] = 'Moscow'

# to_s

puts 'to_s:'
puts djizos.to_s


# delete

usersBase.delete('Джизос Крайст')
puts 'Удалился - печатаем пустое место:'
puts usersBase.select('Джизос Крайст').to_s

puts 'Все пользователи:'
puts usersBase.all.to_s


puts '------ send... ------'
sender = Sender.new(usersBase.all)
sender.sendAll
puts '------ sended ------'

# Оценка 3 (нет to_s - 0.5, высокая связность - 1, лишний код - 0.5)
# Указания:
# 1. Переопределить to_s (ок)
# 2. Реализовать приложенную диаграмму классов (?)
# 3. 'short' 'long' заменить на Обозначения (ок)
# 4. удалить getCustomAdress, otherNames и все что с ними связано (ок)
# 5. Разнести классы по файлам (ok)
# 6. Разбить примеры на группы: create update select delete (ок, кроме update)
# И задание
# "- реализовать класс Database, кот будет предоставлять интерфейс для получения
# конкретного пользователя по имени (поиск), будет иметь пвозможность хранить несколько емейлов,
# телефонов и джабберов на одного пользователя, записи новых пользователей, новых контактов, редактирования (изменить пользователя, )
# create, update, select, delete"
# будет выполнено
# НОВОЕ ЗАДАНИЕ
# Необходимо реализовать алгоритм выборки всех пользователей с последующей генерацией на каждый адрес пользователя сообщения
# Уважаемый, <Имя пользователя> Просьба погасить задолженность до <индивидуальная дата погашения> С уважением Банк
# Забыл: Сообщения на различные адреса должны отличаться (например: смс - текст, email - html -- придумай),
# одинаковых быть не должно

