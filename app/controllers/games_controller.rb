class GamesController < ApplicationController
  def create
    user = User.find_by token: request.headers['tkn']
    if user
      game = user.games.new(:name => params[:name], :platform => params[:platform])
      game_inserted = user.save
      if game_inserted
        render json: {response: true}
      else
        render json: {error: 'Error (check params maybe?)'}
      end
    else
      render json: {error: 'Restricted Access'}
    end
  end

  def get_all
    render json: Game.all
  end
end
