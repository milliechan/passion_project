post '/sessions/new' do 
	@user = User.find_by(username: params[:username])
	if @user
		@user.authenticate(params[:password])
		login(@user)
		redirect '/posts'
	else
		@login_error = "Invalid username or password"
		erb :index
	end

end