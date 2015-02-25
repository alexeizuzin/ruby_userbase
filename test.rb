# encoding: utf-8

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

class UsersDB
	def initialize(arr = [])
		@usersArr = arr
	end
	def addUser(obj)
		@usersArr.push obj
	end
	def selectByUsername(username)
		@usersArr.detect { |e| e.getUsername == username }
	end

	def selectByIndex(index)
		@usersArr[index]
	end
	def getIndex(username)
		@usersArr.index(selectByUsername(username))
	end

	def delete(username)
		@usersArr.delete(selectByUsername(username))
	end
	def getLength
		@usersArr.length
	end
end


class User
	def User.setCitiesBase(base)
		@@citiesBase = base
	end
	def User.setUsersBase(base)
		@@usersBase = base
	end
	def initialize(username)
		@username = username
		@userAddress = {
			country: 'Россия',
			street: nil,
			homeNumber: nil,
			flatNumber: nil
		}
		@userEmails = []
		@userPhones = []
		@userCityObj = nil
		@@usersBase.addUser self
	end
	def setEmails(arr)
		@userEmails = arr
	end
	def setCity(city)
		@userCityObj = @@citiesBase.detect { |e| e[ :name ] == city }
	end
	def getEmails()
		@userEmails
	end
	def setPhones(arr)
		@userPhones = arr
	end
	def getPhones()
		@userPhones
	end
	def setAddress(arr)
		@userAddress = arr
	end
	def getAddress()
		@userAddress
	end
	def getTextAddress(type = :long)
		country = @userAddress[ :country ]
		city = @userCityObj[:name]
		street = @userAddress[ :street ]
		homeNumber = @userAddress[ :homeNumber ].to_s
		flatNumber = @userAddress[ :flatNumber ].to_s
		if type == :long
			address = country + ", город " + city + ", улица " + street + ", дом " + homeNumber  + ", квартира " + flatNumber
		end
		if type == :short
			address = country + ', г. ' + city + ', ул. ' + street + ' ' + homeNumber + ', кв. ' + flatNumber
		end
		address
	end
	def getUsername()
		@username
	end
	def setUsername(username)
		@username = username
	end
	def to_s
		@username.to_s + ' / ' + getTextAddress + ' / ' + @userEmails.to_s
	end
end

usersBase = UsersDB.new
User.setCitiesBase citiesBase
User.setUsersBase usersBase

# create

# добавление нового пользователя
user4 = User.new('Джизос Крайст')

# update

address4 = user4.getAddress
address4[:street] = 'Сталина'
address4[:homeNumber] = 12
address4[:flatNumber] = 4
emails4 = user4.getEmails
emails4.push 'djisos@ya.ru'
emails4.push 'djisos@gmail.com'

# select

usersBase.selectByIndex(0).setCity('Москва')

# вывод

puts 'Адреса: '
puts usersBase.selectByIndex(0).getTextAddress
puts 'Адреса (кратко): '
puts usersBase.selectByIndex(0).getTextAddress(:short)
# город меняет название одной строчкой
citiesBase[0][:name] = 'Moscow'

# to_s

puts 'to_s:'
puts usersBase.selectByIndex(0).to_s


# delete

usersBase.delete('Джизос Крайст')
puts 'Удалился?:'
puts usersBase.selectByIndex(0).to_s

# Оценка 3 (нет to_s - 0.5, высокая связность - 1, лишний код - 0.5)
# Указания:
# 1. Переопределить to_s (ок)
# 2. Реализовать приложенную диаграмму классов
# 3. 'short' 'long' заменить на Обозначения (ок)
# 4. удалить getCustomAdress, otherNames и все что с ними связано (ок)
# 5. Разнести классы по файлам
# 6. Разбить примеры на группы: create update select delete (ок)
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

