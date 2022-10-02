class Model < ApplicationRecord
  belongs_to :brand
  validates_uniqueness_of :name, :message => "The Name is already registered."

end
