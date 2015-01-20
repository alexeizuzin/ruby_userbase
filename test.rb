# encoding: utf-8

# TODO хочу чтобы можно было сделать так
# получить client1 (например по selectByUsername) и как-то получить у него почтовый адрес => "Россия, г.Горький, ул. Космическая, 60 - 298"
# получить client2 почтовый адрес => "Россия, г.Горький, ул. Дьяконова, 10 - 5"
# (затем у нас переименовывается город Горький в Нижний Новгород)
# я беру тех же client1 и client2 и город в почтовом адресе меняется
# потом я хочу взять и выводить адреса в разных форматах то с сокращениями "г." то с полными названиями "город", "улица", "дом", "квартира"


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
			cityCode: nil,
			street: nil,
			homeNumber: nil,
			flatNumber: nil
		}
		@userEmails = []
		@userPhones = []
		@@userBase.addUser self
	end
	def setEmails(arr)
		@userEmails = arr
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
	def getTextAddress(type = 'long')
		country = @userAddress[ :country ]
		city = @@citiesBase[ @userAddress[:cityCode] ][:name]
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
contacts2[:cityCode] = 0
contacts2[:street] = 'Ленина'
contacts2[:homeNumber] = 56
contacts2[:flatNumber] = 1


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
address4[:cityCode] = 1
address4[:street] = 'Сталина'
address4[:homeNumber] = 12
address4[:flatNumber] = 4
emails4 = user4.getEmails
emails4.push 'djisos@ya.ru'
emails4.push 'djisos@gmail.com'

puts 'Адреса: '
puts Baza.selectByIndex(0).getTextAddress
puts Baza.selectByIndex(1).getTextAddress

# Резолюция: не нашел как сменить старое название города на новое - 3 (неудовл), заставил удалять TODO - 0.5 .
# Исправлены второстепенные замечания
# Оценка 2- (да к тому же не вовремя)
# Рекомендации: в памяти держать только текущее название города, название менять во время выполнения программы на произвольное
# (то же касается слов 'город', 'ул.' и т.п)
