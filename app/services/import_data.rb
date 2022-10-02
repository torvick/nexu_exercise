class ImportData

  def self.build(*args)
    new(*args).build!
  end

  def initialize(args)
    @args    = args
  end

  def build!
    @brands_uniqs = @args.pluck("brand_name").uniq
    @brands = set_brands(@brands_uniqs)
    @models = set_models(@args)
    {brands: @brands, models: @models}
  end

  def set_brands(args_brands)
    correct = []
    incorrect = []
    args_brands.each do |arg_brand|
      brand = Brand.new(name: arg_brand)
      if brand.save
        correct << brand
      else
        incorrect << brand
      end
    end
    {correct: correct, incorrect: incorrect}
  end

  def set_models(args_models)
    correct = []
    incorrect = []
    args_models.each do |arg_model|
      brand = Brand.find_by(name: arg_model["brand_name"])
      if brand.nil?
        incorrect << arg_model
      else
        model = Model.new(name: arg_model["name"],average_price: arg_model["average_price"], brand_id: brand.id)
        if model.save
          correct << model
        else
          incorrect << model
        end
      end
    end
    {correct: correct, incorrect: incorrect}
  end

end
