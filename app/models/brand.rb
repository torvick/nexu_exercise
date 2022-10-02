class Brand < ApplicationRecord
  has_many :models
  validates_uniqueness_of :name, :message => "The Name is already registered."

  def self.averages
    total = self.select("brand_id, sum(price) as total_price").group("brand_id")
    total.total_price
    debugger
  end

end
