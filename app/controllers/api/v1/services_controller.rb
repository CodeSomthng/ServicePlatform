class Api::V1::ServicesController < ApplicationController
  before_action :set_service, only: %i[show update destroy]
  MAX_PAGINATION_LIMIT = 100

  # GET api/v1/services
  def index
    @services = Service.limit(limit).offset(params[:offset])

    render json: @services
  end

  # GET api/v1/services/1
  def show
    render json: @service
  end


  def create
    @service = Service.new(service_params)

    if @service.save
      render json: @service, status: :created, location: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      render json: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy

    head :no_content
  end

  private

  def limit
    [
      params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end


  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title)
  end
end
