class User
	def User.setCitiesBase(base)
		@@citiesBase = base
	end
	# def User.setUsersBase(base)
	# 	@@usersBase = base
	# end
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
		@userJabbers = []
		@userCityObj = nil
		# @@usersBase.addUser self
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
	def getPhones()
		@userPhones
	end
	def getJabbers()
		@userJabbers
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
		@username.to_s + ' / ' + getTextAddress + ' / ' + @userEmails.to_s + ' / ' + @userPhones.to_s + ' / ' + @userJabbers.to_s
	end
end