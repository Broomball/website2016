class PlayersController < ApplicationController
# <<<<<<< HEAD
  # #List players w/stats
  # def listPlayers
  # end
#
  # #Profile Page for current user
  # def profile
  # end
#
  # #Goes to schedule of the current user
  # def schedule
  # end
#
  # #Lists the stats for the current user
  # def stats
  # end
# =======
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @playerteams = PlayerTeam.joins(:team).select("teams.id, name, season_id").where(player_id: @player.id)
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit

  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update_attributes(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def residencyindex
    @players=Player.all
  end

  def import
    begin
      Player.import(params[:file])
      redirect_to '/residencyindex', notice: "Residency Data Imported!"
    rescue
      redirect_to '/residencyindex', notice: "Invalid CSV file format"
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:mtu_id, :first_name, :last_name, :nickname, :email, :profile_pic, :remove_profile_pic, :major, :hometown, :position, :height_feet, :height_inches, :years_played, :description)
    end
end
