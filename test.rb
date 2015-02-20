# encoding: utf-8



citiesBase = [
	{
		name: 'Москва',
		otherNames: ['Moscow', 'ДС', 'Не резиновая']
	},
	{
		name: 'Санкт Петербург',
		otherNames: ['Питер', 'Saint Petersburg', 'ДС2']
	},
	{
		name: 'Нижний Новгород',
		otherNames: ['Горький', 'Нижний', 'Nizhny Novgorod']
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


class Users
	def Users.setCitiesBase(base)
		@@citiesBase = base
	end
	def Users.setUserBase(base)
		@@userBase = base
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
		@userCustomCity = ''
		@userCityObj = nil
		@@userBase.addUser self
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
	def getCustomCity()
		@userCustomCity
	end
	def setCustomCity(string)
		@userCustomCity = string
	end
	def setAddress(arr)
		@userAddress = arr
	end
	def getAddress()
		@userAddress
	end
	def getTextAddress(type = 'long')
		country = @userAddress[ :country ]
		city = @userCityObj[:name]
		street = @userAddress[ :street ]
		homeNumber = @userAddress[ :homeNumber ].to_s
		flatNumber = @userAddress[ :flatNumber ].to_s
		if type == 'long'
			address = country + ", город " + city + ", улица " + street + ", дом " + homeNumber  + ", квартира " + flatNumber
		end
		if type == 'short'
			address = country + ', г. ' + city + ', ул. ' + street + ', ' + homeNumber + ' - ' + flatNumber
		end
		address
	end
	def getCustomAddress(country = '', city = 'город ', street = 'улица ', home = 'дом ', flat = 'квартира ')
		countryName = @userAddress[ :country ]
		cityName = @userCustomCity
		streetName = @userAddress[ :street ]
		homeNumber = @userAddress[ :homeNumber ].to_s
		flatNumber = @userAddress[ :flatNumber ].to_s

		country + countryName + ", " +
		city + cityName + ", " +
		street + streetName + ", " +
		home + homeNumber + ", " +
		flat + flatNumber

	end
	def getUsername()
		@username
	end
	def setUsername(username)
		@username = username
	end
end

Baza = UsersDB.new
Users.setCitiesBase citiesBase
Users.setUserBase Baza

user2 = Users.new('Petra')


contacts2 = user2.getAddress
contacts2[:street] = 'Ленина'
contacts2[:homeNumber] = 56
contacts2[:flatNumber] = 1

puts Baza.selectByIndex(0)
Baza.selectByIndex(0).setCity('Москва')


puts 'Адрес Петры: '
puts user2.getTextAddress
puts 'А вот покороче: '
puts user2.getTextAddress 'short'

# добавления конкретного адреса, нескольких адресов одного типа
emails2 = user2.getEmails
emails2.push 'alibaba@ya.ru'
emails2.push 'alibaba@gmail.com'
puts 'email: ' + user2.getEmails.to_s

phones2 = user2.getPhones
phones2.push '+7-123-34-56-78'
phones2.push '02'
puts 'phone: ' + user2.getPhones.to_s

# добавление нового пользователя
user4 = Users.new('Джизос Крайст')
address4 = user4.getAddress
address4[:street] = 'Сталина'
address4[:homeNumber] = 12
address4[:flatNumber] = 4
emails4 = user4.getEmails
emails4.push 'djisos@ya.ru'
emails4.push 'djisos@gmail.com'


Baza.selectByIndex(1).setCity('Москва')

puts 'Адреса: '
puts Baza.selectByIndex(0).getTextAddress
puts Baza.selectByIndex(1).getTextAddress
# город меняет название одной строчкой
citiesBase[1][:name] = 'Петроград'
puts Baza.selectByIndex(1).getTextAddress

# но можно город хранить и в юзере
Baza.selectByIndex(1).setCustomCity 'Сан Себастьян'
puts Baza.selectByIndex(1).getCustomAddress
Baza.selectByIndex(1).setCustomCity 'Мариуполь'
# город переименован в юзере (наверно переехал)
puts Baza.selectByIndex(1).getCustomAddress('country ', 'city ', 'street ', 'building: ', 'flat: ' )



puts Baza.selectByIndex(1).getCustomAddress('country ', 'city ', 'street ', 'building: ', 'flat: ' )



# Оценка 3 (нет to_s - 0.5, высокая связность - 1, лишний код - 0.5)
# Указания:
# 1. Переопределить to_s
# 2. Реализовать приложенную диаграмму классов
# 3. 'short' 'long' заменить на Обозначения
# 4. удалить getCustomAdress, otherNames и все что с ними связано
# 5. Разнести классы по файлам
# 6. Разбить примеры на группы: create update select delete
# И задание
# - реализовать класс Database, кот будет предоставлять интерфейс для получения
# конкретного пользователя по имени (поиск), будет иметь пвозможность хранить несколько емейлов,
# телефонов и джабберов на одного пользователя, записи новых пользователей, новых контактов, редактирования (изменить пользователя, )
# create, update, select, delete
# будет выполнено
# НОВОЕ ЗАДАНИЕ
# Необходимо реализовать алгоритм выборки всех пользователей с последующей генерацией на каждый адрес пользователя сообщения
# Уважаемый, <Имя пользователя> Просьба погасить задолженность до <индивидуальная дата погашения> С уважением Банк

