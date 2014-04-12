class UsersController < ApplicationController
  before_filter do
    @logged_in_user = User.where(id: session[:logged_in_user_id]).first
    if @logged_in_user != nil && @logged_in_user.was_email_verified != true
      flash.now[:remind_to_verify_email] = true
    end
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
    @user                          = User.new
    @user.email                    = params[:email]
    @user.password                 = params[:password]
    @user.password_confirmation    = params[:password_confirmation]
    @user.email_verification_token = rand(10 ** 8)
    if @user.save == true
      session[:logged_in_user_id] = @user.id
      flash[:success] = "Your account has been created"

      link = verify_email_url(@user.id, @user.email_verification_token)
      Pony.mail(
        to:        @user.email,
        subject:   "Thanks for registering",
        body:      "Please click the following link to verify your email address: #{link}",
        html_body: "Please click <a href='#{link}'>here</a> to verify your email address."
      )

      session[:logged_in_user_id] = @user.id

      redirect_to users_path and return
    else
      render :new and return
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

  def verify_email
    user = User.where(id: params[:user_id]).first
    if user != nil
      if user.email_verification_token == params[:token]
        user.was_email_verified = true
        user.save!
        flash[:success] = "Email has been verified."
        session[:logged_in_user_id] = user.id
      else
        flash[:error] = "Wrong email verification token"
      end
      redirect_to users_path and return
    else
      flash[:error] = "Couldn't find user with that ID"
    end
  end

  def resend_verification_email
    Pony.mail(
      to:      @logged_in_user.email,
      subject: "Thanks for registering",
      body:    "Please click the following link to verify your email address:
      #{verify_email_url(@logged_in_user.id, @logged_in_user.email_verification_token)}"
    )
    flash[:success] = "Verification email sent."
    redirect_to params[:afterwards_go_to]
  end
  
  def email
    render :email and return
  end
  
  def send_email
    @user = User.find_by(email: params[:email])
    session[:email] = params[:email]
    link = reset_password_url(@user.id, @user.email_verification_token)
      Pony.mail(
        to:        @user.email,
        subject:   "Reset password",
        body:      "Please click the following link to update your password: #{link}",
        html_body: "Please click <a href='#{link}'>here</a> to verify your email address."
      )
    flash.now[:success] = "thank you, now please check click the link in the email just sent"
    render :email and return
  end
  
  def reset
    render :reset and return
  end
  
  def reset_password
    @user = User.find_by(email: session[:email])
    @user.password                 = params[:password]
    @user.password_confirmation    = params[:password_confirmation]
    if @user.save == true
      flash.now[:success] = "Your password has been updated"
      redirect_to "/" and return
    else
      flash[:error] = "the passwords you entered don't match"
      render :reset and return
    end
  end
  
end
