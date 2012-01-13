class UsersController < ApplicationController
  def new 
  @user = User.new
  end
def show
  @user = User.find(params[:id])
end
def create
    if User.where(:email => params[:email]).present?
		@user = User.where(:email => params[:email]).first
		redirect_to @user
	else
		@user = User.new(:email => params[:email], :name => params[:name])
		if @user.save
			redirect_to @user
		else 
			render 'new'
		end
	end
end
end
