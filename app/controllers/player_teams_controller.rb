class PlayerTeamsController < ApplicationController
  before_action :set_player_team, only: [:show, :edit, :update, :destroy]

  # GET /player_teams
  # GET /player_teams.json
  def index
    @player_teams = PlayerTeam.all
  end

  # GET /player_teams/1
  # GET /player_teams/1.json
  def show
  end

  # GET /player_teams/new
  def new
    @player_team = PlayerTeam.new
    @team = Team.find(params[:team])
  end

  # GET /player_teams/1/edit
  def edit
  end

  # POST /player_teams
  # POST /player_teams.json
  def create
    param=player_team_params
    mtuid=param[:player_id]
    player=Player.where(mtu_id: mtuid).first
    player_team_params[:player_id]=player.id

    @player_team = PlayerTeam.new(player_team_params)
    @player_team.player_id=player.id

    respond_to do |format|
      if @player_team.save
        format.html { redirect_to team_path(@player_team.team_id), notice: 'Player team was successfully created.' }
        format.json { render :show, status: :created, location: @player_team }
      else
        format.html { render :new }
        format.json { render json: @player_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_teams/1
  # PATCH/PUT /player_teams/1.json
  def update
    respond_to do |format|
      if @player_team.update(player_team_params)
        format.html { redirect_to @player_team, notice: 'Player team was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_team }
      else
        format.html { render :edit }
        format.json { render json: @player_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_teams/1
  # DELETE /player_teams/1.json
  def destroy
    @player_team.destroy
    respond_to do |format|
      format.html { redirect_to player_teams_url, notice: 'Player team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_team
      @player_team = PlayerTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_team_params
      params.require(:player_team).permit(:team_id, :player_id, :captain)

      #t = Player.where(mtu_id: :player_id).first.id;
    end
end
