class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :playergamestats]

  # GET /games
  # GET /games.json
  def index
    player = params[:player].present? ? params[:player] : nil
    @games = if player
      Game.joins(:players).where('players.id = ?', player)
    else
      Game.all
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit

  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      byebug
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def schedulegames
    @games=Game.all
  end

  def creategamesschedule
    begin
      Game.creategames("test")
      redirect_to '/schedulegames', notice: "Games Successfully Scheduled!"
    rescue
      redirect_to '/schedulegames', notice: "Unable to Schedule Games"
    end
  end

  def playergamestats

    @home_team_players = []
    @home_team_player_games = []
    @game.home_team.players.each do |htp|
      pg = PlayerGame.where(player: htp, game: @game).first_or_create
      @home_team_players << htp
      @home_team_player_games << pg
    end

    @away_team_players = []
    @away_team_player_games = []
    @game.away_team.players.each do |atp|
      pg = PlayerGame.where(player: atp, game: @game).first_or_create
      @away_team_players << atp
      @away_team_player_games << pg
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.fetch(:game).permit(:home_goals, :away_goals, :overtime_loss)
    end
end
