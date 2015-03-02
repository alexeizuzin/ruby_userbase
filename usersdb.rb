
class Database
	def setClassUser(userClassName)
		@@user = userClassName
	end
	def initialize(arr = [])
		@usersArr = arr
	end
	def create(username)
		user = @@user.new(username)
		addUser(user)
		user
	end
	def addUser(obj)
		@usersArr.push obj
	end
	def select(username)
		@usersArr.detect { |e| e.getUsername == username }
	end
	def delete(username)
		@usersArr.delete(select(username))
	end
	def getLength
		@usersArr.length
	end
	def all
		@usersArr
	end
end