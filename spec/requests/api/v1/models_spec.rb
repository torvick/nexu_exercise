require 'rails_helper'

RSpec.describe "Api::V1::Models", type: :request do
  it "creates a Models" do
    @brand = Brand.create!(name: "Audi")
    post "/api/v1/models", :params => { :model => {:name => "ILX#{rand(9412243)}", :average_price => 303176, :brand_id => @brand.id} }
    expect(response).to have_http_status(:created)
 end

  it 'returns all Models' do
    get '/api/v1/models'
    expect(response).to have_http_status(:success)
  end
end
