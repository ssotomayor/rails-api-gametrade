class AccountController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :restrict_access, except: [:index, :signin, :create_user]

  def signin
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        auth_user = found_user.authenticate(Digest::SHA1.hexdigest(params[:password]))
        if auth_user
          result = false
          until result
            token = SecureRandom.hex + Time.now.to_i.to_s
            auth_user.token = token
            result = auth_user.save
            msg = {token: token}
          end
        else
          msg = {error: 'username or password wrong'}
        end
      end
    else
      msg = {error: 'username or password wrong'}
    end
    render json: msg
  end


  def signout
  end

  def create_user
    user = User.new(:username => params[:username],
                    :password => Digest::SHA1.hexdigest(params[:password]),
                    :token => SecureRandom.hex + Time.now.to_i.to_s)
    response = user.save
    render json: {response: response}
  end

  def get_user_data
    usr = User.find_by username: params[:id]
    games = Game.find_by_user_id(usr.id)
    render json: usr.to_json(:include => :games)
  end

  private

  def restrict_access
    user = User.find_by token: request.headers['tkn']
    if !user
      render json: {error: 'Restricted Access'}
    end
  end
end
