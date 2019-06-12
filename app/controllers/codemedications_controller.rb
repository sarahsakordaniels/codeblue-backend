class CodemedicationsController < ApplicationController
  before_action :set_codemedication, only: [:show, :update, :destroy]

  # GET /codemedications
  def index
    @codemedications = Codemedication.all

    render json: @codemedications
  end

  # GET /codemedications/1
  def show
    render json: @codemedication
  end

  # POST /codemedications
  def create
    @codemedication = Codemedication.new(codemedication_params)

    if @codemedication.save
      render json: @codemedication, status: :created, location: @codemedication
    else
      render json: @codemedication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /codemedications/1
  def update
    if @codemedication.update(codemedication_params)
      render json: @codemedication
    else
      render json: @codemedication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /codemedications/1
  def destroy
    @codemedication.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codemedication
      @codemedication = Codemedication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def codemedication_params
      params.fetch(:codemedication, {})
    end
end
