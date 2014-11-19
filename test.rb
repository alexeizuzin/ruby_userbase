
# TODO Сделать поддержку нескольких адресов
class UsersDB
	private @lang
	def initialize(usersArr = [])
		@usersArr = usersArr
	end
	def create(username)
		if !selectByUsername(username)
			newUser = {}
			newUser['username'] = username.to_s
			newUser['userData'] = {}
			@usersArr.push(newUser)
		else
			puts 'This user already exists'
		end
	end
	def selectByUsername(username)
		user = false
		# TODO переписать поиск оптимальней
		@usersArr.each{
			|element|
			# Зачем делать to_s ?
			if element['username'].to_s == username.to_s
			 	user = element
			end
		}
		user
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
myUsersDB = UsersDB.new([{},{}])
myUsersDB.create(56)
myUsersDB.create(55555)
puts myUsersDB.selectByUsername(55555)
myUsersDB.updateUsername(55555, {'username' => 'five'})
myUsersDB.create('55555')
puts 'kolichestvo polzovateley: ' + myUsersDB.getLength.to_s
myUsersDB.delete('55555')
myUsersDB.create('55555')

puts myUsersDB.selectByIndex(0)
puts myUsersDB.selectByIndex(1)
puts myUsersDB.selectByIndex(2)
puts myUsersDB.selectByIndex(3)
puts myUsersDB.selectByIndex(4)
puts myUsersDB.selectByIndex(5)
puts myUsersDB.selectByUsername('five')
puts myUsersDB.selectByUsername(56)
