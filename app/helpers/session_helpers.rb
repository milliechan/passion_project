helpers do
	def login(user)
		session[:id] = user.id 
	end

	def logged_in?
		session[:id].present? 
	end
end

