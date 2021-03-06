class MotsController < ApplicationController
  before_action :set_mot, only: [:show, :edit, :update, :destroy]

  # GET /mots
  # GET /mots.json
  def index
    @mots = Mot.all
  end

  # GET /mots/1
  # GET /mots/1.json
  def show
  end

  # GET /mots/new
  def new
    @mot = Mot.new
  end

  # GET /mots/1/edit
  def edit
  end

  # POST /mots
  # POST /mots.json
  def create
    @mot = Mot.new(mot_params)

    respond_to do |format|
      if @mot.save
        format.html { redirect_to @mot, notice: 'Le mot a bien été créé.' }
        format.json { render :show, status: :created, location: @mot }
      else
        format.html { render :new }
        format.json { render json: @mot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mots/1
  # PATCH/PUT /mots/1.json
  def update
    respond_to do |format|
      if @mot.update(mot_params)
        format.html { redirect_to @mot, notice: 'Le mot a bien été modifié.' }
        format.json { render :show, status: :ok, location: @mot }
      else
        format.html { render :edit }
        format.json { render json: @mot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mots/1
  # DELETE /mots/1.json
  def destroy
    @mot.destroy
    respond_to do |format|
      format.html { redirect_to mots_url, notice: 'Le mot a bien été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mot
      @mot = Mot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mot_params
      params.require(:mot).permit(:abreviation, :signification)
    end
end
