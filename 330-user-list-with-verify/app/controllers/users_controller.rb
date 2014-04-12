class UsersController < ApplicationController
  before_filter do
    @logged_in_user = User.where(id: session[:logged_in_user_id]).first
  end

  def index
    @users = User.order("id")
    render :index and return
  end

  def new
    @user = User.new
    render :new and return
  end

  def create
    @user = User.new
    @user.email                 = params[:email]
    @user.password              = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.email_verification_token = rand(10 ** 8)
    if @user.save
      session[:logged_in_user_id] = @user.id
      flash[:success] = "Your account has been created"
      
      Pony.mail(
        to:      @user.email,
        subject: "Thanks for registering",
        body:    "You can login at #{verify_email_url(@user.id, @user.email_verification_token)}."
      )

      redirect_to users_path and return
    else
      render :new and return
    end
  end
  
  def verify_email
    @user = User.find(params[:user_id])
    if @user.email_verification_token = params[:token]
      @user.was_email_verfied = true
      @user.save!
      flash[:success] = "You have set up an account"
      redirect_to "/" and return
    end
  end

  def login
    named_user = User.where(email: params[:email]).first
    if named_user && named_user.authenticate(params[:password])
      session[:logged_in_user_id] = named_user.id
    else
      flash[:error] = "Wrong email or password"
    end
    redirect_to users_path and return
  end

  def logout
    session.clear
    redirect_to users_path and return
  end
end
