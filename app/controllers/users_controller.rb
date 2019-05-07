class UsersController < ApplicationController
  def index
    @users = User.all
    puts @users.inspect
  end

  def new
    render 'new'
  end

  def create
      user = User.create(first_name:params[:first_name],last_name:params[:last_name],email:params[:email],password:params[:password])
      if user.errors.full_messages.empty?
        redirect_to '/'
      else
        flash[:errors] = user.errors.full_messages
        puts "User creation error"
      # puts params[:first_name]
      # puts params[:last_name]
      # puts params[:email]
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      User.find(params[:id]).update(first_name:params[:first_name],last_name:params[:last_name],email:params[:email],password:params[:password])
      redirect_to '/'
  end

  def destroy
    user = User.find(params[:id]).destroy
  end

end
