# TODO Исправить ошибку test.rb:59: invalid multibyte char (US-ASCII) (SyntaxError)

# TODO Использовать все типы данных о которых прочитал

# TODO Удалять туду и комментарии после выполнения
class UsersDB
	def initialize(usersArr = [])
		@usersArr = usersArr
	end
	def create(username)
		if !selectByUsername(username)
			newUser = {}
			newUser['username'] = username
			newUser['userData'] = {}
			@usersArr.push(newUser)
		else
			puts 'This user already exists'
		end
	end
	def selectByUsername(username)
    # TODO переписать согласно https://github.com/bbatsov/ruby-style-guide#single-line-blocks
		@usersArr.detect {
			|e|
			e['username'] == username
		}
	end
	def addContacts(username, type, contactsArr = [])
    # TODO? почему используешь в ключах строки а не Symbol? Возможно нужно переделать если да, то почему?
    # (этот комментарий уже был в виде гитовского комментария)
    # Ответ жду комментарием
		if selectByUsername(username)
			if !selectByUsername(username)['userData'][type]
				selectByUsername(username)['userData'][type] = []
			end
			selectByUsername(username)['userData'][type] += contactsArr
		else
			puts 'This user not exists'
		end
	end
	def selectByIndex(index)
		@usersArr[index]
	end
	def getIndex(username)
		@usersArr.index(selectByUsername(username))
	end
	def updateUsername(username, newUserArr)
		@usersArr[getIndex(username)] = newUserArr
	end

	def delete(username)
		@usersArr.delete(selectByUsername(username))
	end
	def getLength
		@usersArr.length
	end
end

# Где добавления конкретного адреса, нескольких адресов одного типа (например двух телефонов) ?
myUsersDB = UsersDB.new()
myUsersDB.create('Pedro')
puts myUsersDB.selectByUsername('Pedro')
myUsersDB.addContacts('Peсdro', 'email', ['hihihi@ya.ru', 'hohohoho@gmail.com'])
puts myUsersDB.selectByUsername('Pedro')
myUsersDB.addContacts('Pedro', 'email', ['haha@mail.ru', 'hehehe@yahoo.com'])
puts myUsersDB.selectByUsername('Pedro')

# TODO хочу чтобы можно было сделать так
# получить client1 (например по selectByUsername) и как-то получить у него почтовый адрес => "Россия, г.Горький, ул. Космическая, 60 - 298"
# получить client2 почтовый адрес => "Россия, г.Горький, ул. Дьяконова, 10 - 5"
# (затем у нас переименовывается город Горький в Нижний Новгород)
# я беру тех же client1 и client2 и город в почтовом адресе меняется
# потом я хочу взять и выводить адреса в разных форматах то с сокращениями "г." то с полными названиями "город", "улица", "дом", "квартира"


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
