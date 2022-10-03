class Api::V1::ModelsController < ApplicationController
  before_action :set_model, only: %i[ update ]

  def index
    if params[:greater].present? or params[:lower].present?
      @models = Model.where(average_price: params[:lower]..params[:greater]) if params[:greater].present? and params[:lower].present?
      @models = Model.where('? > average_price' , params[:lower])            if params[:lower].present?   and !params[:greater].present?
      @models = Model.where('? < average_price' , params[:greater])          if params[:greater].present? and !params[:lower].present?
    else
      @models = Model.all
    end
    render json: @models, status: :ok
  end

  def create
    @model = Model.new(model_params)
    if @model.save
      render json: @model, status: :created
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  def update
    if @model.update(model_params)
      render json: @model, status: :ok
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  def import
    response = ImportData.build(params[:data])
    render json: response, status: :ok
  end

  private

  def set_model
    @model = Model.find(params[:id])
  rescue Exception => e
    @error = CodeError.find_by(name: "set_model")
    return render json: {code: @error.value, message: @error.description}, status: :unprocessable_entity
  end

  def model_params
    params.require(:model).permit(:name, :average_price, :brand_id)
  end
end
