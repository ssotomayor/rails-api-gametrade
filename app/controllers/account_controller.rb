class AccountController < ApplicationController
  before_action :restrict_access, except: [:index, :signin, :create_user]

  def signin
    if params[:username].present? && params[:password].present?
      auth_user = User.find_by(:username => params[:username], :password => Digest::SHA1.hexdigest(params[:password]))
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
    else
      msg = {error: 'username or password wrong'}
    end
    render json: msg
  end


  def signout
  end

  def create_user
    platform = Device.find(params[:platformId])
    if (platform)
      user = User.create(
          username: params[:username],
          password: Digest::SHA1.hexdigest(params[:password]),
          token: SecureRandom.hex + Time.now.to_i.to_s,
          devices: [platform])
      response = user.save
    else
      response = false
    end
    render json: {response: response}
  end

  def get_user_data
    usr = User.find_by(username: params[:username])
    render json: usr.to_json(:include => :games)
  end

  def add_game
    game = Game.find(params[:gameId])
    response = false
    if(game)
      user = User.find_by(:token => request.headers['tkn'])
      if(!user.games.any?{|game| game.name} && !user.games.any?{|game| game.platform})
        user.games.new(name: game.name, platform: game.platform)
        response = user.save
      end
    end
    render json: {response: response}
  end

  private

  def restrict_access
    user = User.find_by token: request.headers['tkn']
    if !user
      render json: {error: 'Restricted Access'}
    end
  end
end
