class PlayerGamesController < ApplicationController
  before_action :set_player_game, only: [:show, :edit, :update, :destroy]

  # GET /player_games
  # GET /player_games.json
  def index
    @player_games = PlayerGame.all
  end

  # GET /player_games/1
  # GET /player_games/1.json
  def show
  end

  # GET /player_games/new
  def new
    @player_game = PlayerGame.new
  end

  # GET /player_games/1/edit
  def edit
  end

  # POST /player_games
  # POST /player_games.json
  def create
    @player_games = PlayerGame.update(permit_player_game_params["away_team_player_games"].keys, permit_player_game_params["away_team_player_games"].values)

    respond_to do |format|
      if @player_games
        format.html { redirect_to game_path(@player_games.first.game_id), notice: 'Player stats were successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { redirect_to games_path, notice: 'Game was unable to be created.' }
        format.json { render json: @player_games.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_games/1
  # PATCH/PUT /player_games/1.json
  def update
    respond_to do |format|
      if @player_game.update(player_game_params)
        format.html { redirect_to @player_game, notice: 'Player game was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_game }
      else
        format.html { render :edit }
        format.json { render json: @player_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_games/1
  # DELETE /player_games/1.json
  def destroy
    @player_game.destroy
    respond_to do |format|
      format.html { redirect_to player_games_url, notice: 'Player game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_game
      @player_game = PlayerGame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_game_params
      params.fetch(:player_game, {})
    end

    def permit_player_game_params
      params.permit(away_team_player_games:[:goals, :assists, :saves])
    end
end
