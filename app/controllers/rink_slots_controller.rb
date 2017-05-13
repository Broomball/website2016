class RinkSlotsController < ApplicationController
  before_action :set_rink_slot, only: [:show, :edit, :update, :destroy]

  # GET /rink_slots
  # GET /rink_slots.json
  def index
    @rink_slots = RinkSlot.all
  end

  # GET /rink_slots/1
  # GET /rink_slots/1.json
  def show
  end

  # GET /rink_slots/new
  def new
    @rink_slot = RinkSlot.new
  end

  # GET /rink_slots/1/edit
  def edit
  end

  # POST /rink_slots
  # POST /rink_slots.json
  def create
    @rink_slot = RinkSlot.new(rink_slot_params)

    respond_to do |format|
      if @rink_slot.save
        format.html { redirect_to @rink_slot, notice: 'Rink slot was successfully created.' }
        format.json { render :show, status: :created, location: @rink_slot }
      else
        format.html { render :new }
        format.json { render json: @rink_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rink_slots/1
  # PATCH/PUT /rink_slots/1.json
  def update
    respond_to do |format|
      if @rink_slot.update(rink_slot_params)
        format.html { redirect_to @rink_slot, notice: 'Rink slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @rink_slot }
      else
        format.html { render :edit }
        format.json { render json: @rink_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rink_slots/1
  # DELETE /rink_slots/1.json
  def destroy
    @rink_slot.destroy
    respond_to do |format|
      format.html { redirect_to rink_slots_url, notice: 'Rink slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rink_slot
      @rink_slot = RinkSlot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rink_slot_params
      params.require(:rink_slot).permit(:rink, :slot)
    end
end
