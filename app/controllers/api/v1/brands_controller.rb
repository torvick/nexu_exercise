class Api::V1::BrandsController < ApplicationController
  before_action :set_brand, only: %i[ models model]
  # attr_accessor :average_price


  def index
    @args = []
    @brands = Brand.all.joins(:models).group('brands.id').select("brands.id,brands.name,AVG(average_price) AS TOTAL")
    @brands.each { |brand| @args << {id: brand.id,name: brand.name ,average_price: brand.total}}
    render json: @args.sort_by { |ord| ord[:id] }, status: :ok
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
      render json: @brand, status: :created
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  rescue Exception => e
    @error = CodeError.find_by(name: "set_brand")
    return render json: {code: @error.value, message: @error.description}, status: :unprocessable_entity
  end

  def brand_params
    params.require(:brand).permit(:name, :price)
  end
end
