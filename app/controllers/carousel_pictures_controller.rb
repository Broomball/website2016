class CarouselPicturesController < ApplicationController
  before_action :set_carousel_picture, only: [:show, :edit, :update, :destroy]

  # GET /carousel_pictures
  # GET /carousel_pictures.json
  def index
    @carousel_pictures = CarouselPicture.all
  end

  # GET /carousel_pictures/1
  # GET /carousel_pictures/1.json
  def show
  end

  # GET /carousel_pictures/new
  def new
    @carousel_picture = CarouselPicture.new
  end

  # GET /carousel_pictures/1/edit
  def edit
  end

  # POST /carousel_pictures
  # POST /carousel_pictures.json
  def create
    @carousel_picture = CarouselPicture.new(carousel_picture_params)

    respond_to do |format|
      if @carousel_picture.save
        format.html { redirect_to @carousel_picture, notice: 'Carousel picture was successfully created.' }
        format.json { render :show, status: :created, location: @carousel_picture }
      else
        format.html { render :new }
        format.json { render json: @carousel_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carousel_pictures/1
  # PATCH/PUT /carousel_pictures/1.json
  def update
    respond_to do |format|
      if @carousel_picture.update(carousel_picture_params)
        format.html { redirect_to @carousel_picture, notice: 'Carousel picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @carousel_picture }
      else
        format.html { render :edit }
        format.json { render json: @carousel_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carousel_pictures/1
  # DELETE /carousel_pictures/1.json
  def destroy
    @carousel_picture.destroy
    respond_to do |format|
      format.html { redirect_to carousel_pictures_url, notice: 'Carousel picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carousel_picture
      @carousel_picture = CarouselPicture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carousel_picture_params
      params.require(:carousel_picture).permit(:title, :description, :picture)
    end
end
