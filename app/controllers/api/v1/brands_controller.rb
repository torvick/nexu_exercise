class Api::V1::BrandsController < ApplicationController
  before_action :set_brand, only: %i[ models model]
  # attr_accessor :average_price


  def index
    debugger
    @brands = Brand.all.select(:id,:name,Model.average_price.sum)
    # @brands.averages
    render json: @brands, status: :ok
  end

  def models
    @models = @brand.models.select(:id,:name,:average_price)#.as_json(include:[:brand => {only:[:id,:name]}])
    render json: @models, status: :ok
  end

  def model
    @model = Model.new({name: params[:name], average_price: params[:average_price], brand_id: params[:id]})
    if @model.save
      render json: @models.as_json(include: [:brands] ), status: :ok
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      render json: @brand, status: :ok
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  rescue Exception => e
    return render json: {code: rand(10000000), message: "La Marca no existe"}, status: :unprocessable_entity
  end

  def brand_params
    params.require(:brand).permit(:name, :price)
  end
end
