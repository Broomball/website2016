class PracticeRinkReservationsController < ApplicationController
  before_action :set_practice_rink_reservation, only: [:show, :edit, :update, :destroy]

  # GET /practice_rink_reservations
  # GET /practice_rink_reservations.json
  def index
    @practice_rink_reservations = PracticeRinkReservation.all
  end

  # GET /practice_rink_reservations/1
  # GET /practice_rink_reservations/1.json
  def show
  end

  # GET /practice_rink_reservations/new
  def new
    @practice_rink_reservation = PracticeRinkReservation.new
  end

  # GET /practice_rink_reservations/1/edit
  def edit
  end

  # POST /practice_rink_reservations
  # POST /practice_rink_reservations.json
  def create
    @practice_rink_reservation = PracticeRinkReservation.new(practice_rink_reservation_params)

    respond_to do |format|
      if @practice_rink_reservation.save
        format.html { redirect_to @practice_rink_reservation, notice: 'Practice rink reservation was successfully created.' }
        format.json { render :show, status: :created, location: @practice_rink_reservation }
      else
        format.html { render :new }
        format.json { render json: @practice_rink_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /practice_rink_reservations/1
  # PATCH/PUT /practice_rink_reservations/1.json
  def update
    respond_to do |format|
      if @practice_rink_reservation.update(practice_rink_reservation_params)
        format.html { redirect_to @practice_rink_reservation, notice: 'Practice rink reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @practice_rink_reservation }
      else
        format.html { render :edit }
        format.json { render json: @practice_rink_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /practice_rink_reservations/1
  # DELETE /practice_rink_reservations/1.json
  def destroy
    @practice_rink_reservation.destroy
    respond_to do |format|
      format.html { redirect_to practice_rink_reservations_url, notice: 'Practice rink reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice_rink_reservation
      @practice_rink_reservation = PracticeRinkReservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def practice_rink_reservation_params
      params.require(:practice_rink_reservation).permit(:team_id, :paid)
    end
end
