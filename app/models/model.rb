class Model < ApplicationRecord
  belongs_to :brand
  validates_uniqueness_of :name, :message => "The Name is already registered."

end

# Brand.all.joins(:models).select("brands.id,brands.name").group('brands.id').average(:average_price)
# SELECT AVG(average_price) AS "average_average_price", "brands"."id" AS "brands_id" FROM "brands" INNER JOIN "models" ON "models"."brand_id" = "brands"."id" GROUP BY "brands"."id"
#
# Brand.all.joins(:models).group('brands.id, brands.name').average(:average_price)
# SELECT AVG(average_price) AS "average_average_price", "brands"."id" AS "brands_id" FROM "brands" INNER JOIN "models" ON "models"."brand_id" = "brands"."id" GROUP BY "brands"."id"



# AVG(average_price) AS "average_average_price"
#
# Model.group(:brand_id).select("SUM(average_price) AS AMOUNT, SUM(average_price) AS BASE")
# SELECT SUM(average_price) AS AMOUNT, SUM(average_price) AS BASE FROM "models" GROUP BY "models"."brand_id"
#
# Brand.all.joins(:models).group('brands.id').select("brands.id,brands.name,AVG(average_price) AS TOTAL")
# SELECT AVG(average_price) AS "average_average_price", "brands"."id" AS "brands_id" FROM "brands" INNER JOIN "models" ON "models"."brand_id" = "brands"."id" GROUP BY "brands"."id"
#
#
# Brand.all.joins(:models).group('brands.id').average(:average_price)
