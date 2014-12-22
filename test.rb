# TODO Исправить ошибку test.rb:59: invalid multibyte char (US-ASCII) (SyntaxError)

# TODO Использовать все типы данных о которых прочитал


# TODO хочу чтобы можно было сделать так
# получить client1 (например по selectByUsername) и как-то получить у него почтовый адрес => "Россия, г.Горький, ул. Космическая, 60 - 298"
# получить client2 почтовый адрес => "Россия, г.Горький, ул. Дьяконова, 10 - 5"
# (затем у нас переименовывается город Горький в Нижний Новгород)
# я беру тех же client1 и client2 и город в почтовом адресе меняется
# потом я хочу взять и выводить адреса в разных форматах то с сокращениями "г." то с полными названиями "город", "улица", "дом", "квартира"



class Users
	@@usersArr = []

	def Users.selectByUsername(username)
		@@usersArr.detect { |e| e[:username] == username }
	end

	def Users.selectByIndex(index)
		@@usersArr[index]
	end
	def Users.getIndex(username)
		@@usersArr.index(selectByUsername(username))
	end

	def Users.delete(username)
		@@usersArr.delete(selectByUsername(username))
	end
	def Users.getLength
		@@usersArr.length
	end
	def Users.getUserAddress(username, long = true)
		user = Users.selectByUsername(username)
		country = user.getAddress[:country]
		city = user.getAddress[:cityCode] ][:name]
		street = user.getAddress[:street]
		homeNumber = user.getAddress[:homeNumber]
		flatNumber = user.getAddress[:flatNumber]
		if long
			address = country + ', город ' + city ', улица ' + street + ', дом ' + homeNumber + ', квартира ' + flatNumber
		else
			address = country + ', г. ' + city ', ул. ' + street + ', ' + homeNumber + ' - ' + flatNumber
		end
		
	end
	def Users.updateUsername(username, newUserArr)
		@usersArr[getIndex(username)] = newUserArr
	end

	def initialize(username)
		@username = username
		@userData = {}
		@userAddress = {
			country: 'Россия'
			cityCode: nil
			street: nil
			homeNumber: nil
			flatNumber: nil
		}
		@userEmails = []
		@@usersArr.push(this) ##############################################
	end
	def setEmails(arr)
		@userEmails = arr
	end
	def getEmails()
		@userEmails
	end
	def setAddress(arr)
		@userEmails = arr
	end
	def getAddress()
		@userEmails
	end
end

# TODO? почему используешь в ключах строки а не Symbol? Возможно нужно переделать если да, то почему?
# - Вначале не понял синтаксис.
# - Переделал. Symbol'ы тут нужны по смыслу. Они не создают отдельный объект, а являются метками для значений кеша, ключами.


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



# Где добавления конкретного адреса, нескольких адресов одного типа (например двух телефонов) ?
myUsersDB = UsersDB.new()
myUsersDB.create('Pedro')
puts myUsersDB.selectByUsername('Pedro')
myUsersDB.addContacts('Peсdro', 'email', ['hihihi@ya.ru', 'hohohoho@gmail.com'])
puts myUsersDB.selectByUsername('Pedro')
myUsersDB.addContacts('Pedro', 'email', ['haha@mail.ru', 'hehehe@yahoo.com'])
puts myUsersDB.selectByUsername('Pedro')






# myUsersDB.create(56)
# myUsersDB.create(55555)
# puts myUsersDB.selectByUsername(55555)
# myUsersDB.updateUsername(55555, {'username' => 'five'})
# myUsersDB.create('55555')
# puts 'kolichestvo polzovateley: ' + myUsersDB.getLength.to_s
# myUsersDB.delete('55555')
# myUsersDB.create('55555')

# puts myUsersDB.selectByIndex(0)
# puts myUsersDB.selectByIndex(1)
# puts myUsersDB.selectByIndex(2)
# puts myUsersDB.selectByIndex(3)
# puts myUsersDB.selectByIndex(4)
# puts myUsersDB.selectByIndex(5)
# puts myUsersDB.selectByUsername('five')
# puts myUsersDB.selectByUsername(56)
