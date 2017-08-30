class PlayersController < ApplicationController

  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:edit, :update]
  before_action :authenticate_admin, only: [:destroy, :create, :import, :residencyindex]

  # GET /players
  # GET /players.json
  def index
    search = params[:query].present? ? params[:query] : nil
    @players = if search
      Player.search(search)
    else
      Player.all
    end
  end

  # GET /players/1
  # GET /players/1.json
  def show
    @playerstats=Player.joins(:teams, :player_games, :player_teams).select('players.first_name, players.last_name, teams.id as team_id, teams.name, teams.season_id, sum(player_games.goals) as goals, sum(player_games.assists) as assists, sum(player_games.saves) as saves').where(id: @player.id).group('teams.id')
    @totalgoals=0
    @totalassists=0
    @totalsaves=0
    @hasaccess=has_access
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
      Player.residencyimport(params[:file])
      redirect_to '/residencyindex', notice: "Residency Data Imported!"
    rescue
      redirect_to '/residencyindex', notice: "Invalid CSV file format"
    end
  end

  def autocomplete
    test = params[:query]
    t=Player.search(params[:query], fields: ['first_name', 'last_name', 'mtu_id', 'full_name'], match: :word_start, limit: 10)
    render json: t.map{|p| "#{p.first_name} #{p.last_name} (#{p.mtu_id})"}
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:mtu_id, :first_name, :last_name, :nickname, :email, :profile_pic, :remove_profile_pic, :major, :hometown, :position, :height_feet, :height_inches, :years_played, :description, :autocomplete)
    end

    # Check if user is logged in and has access to resource
    def authenticate_user
      if !current_user
        redirect_to "/auth/google_oauth2", :id => "sign_in" and return
      elsif current_user.mtu_id != @player.mtu_id && !Player.exists?(mtu_id: current_user.mtu_id, committee: true)
        redirect_to player_path(@player), notice: "The signed in user account cannot access this resource" and return
      end
    end

    # Check if user is logged in as admin
    def authenticate_admin
      if !current_user
        redirect_to "/auth/google_oauth2", :id => "sign_in" and return
      elsif !Player.exists?(mtu_id: current_user.mtu_id, committee: true)
        if @player
          redirect_to player_path(@player), notice: "The signed in user account cannot access this resource" and return
        else
          redirect_to players_path, notice: "The signed in user account cannot access this resource" and return
        end
      end
    end

    # Check if the user has permissions to do further actions (edit/update player)
    def has_access
      if !current_user
        return false
      elsif current_user.mtu_id != @player.mtu_id && !Player.exists?(mtu_id: current_user.mtu_id, committee: true)
        return false
      end
      return true
    end

end
