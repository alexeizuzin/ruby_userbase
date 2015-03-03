class Sender
	def initialize(arr = [])
		@usersArr = arr
	end
	def getSms(user)
		'Уважаемый, ' + user.getUsername + ' Просьба погасить задолженность до ' + '01.04.2017' + '. С уважением Банк'
	end
	def getEmail(user)
		'<h1>Уважаемый, ' + user.getUsername + '!</h1> Просьба погасить задолженность до ' + '01.04.2017' + '. С уважением Банк'
	end
	def getJabMessage(user)
		'Неуважаемый, ' + user.getUsername + '! Погаси задолженность до ' + '01.04.2017' + '. Банк'
	end
	def sendAll
		@usersArr.each do |user|
			puts getSms user
			puts getEmail user
			puts getJabMessage user
		end
	end
end