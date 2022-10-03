require 'rails_helper'

describe "Api::V1::Brands", type: :request do

  it "creates a Brands" do
    post "/api/v1/brands", :params => { :brand => {:name => "Acura"} }
    expect(response).to have_http_status(:created)
  end

  it 'returns all Brands' do
    Brand.create!(name: "Acura")
    Brand.create!(name: "Audi")
    get '/api/v1/brands'
    expect(response).to have_http_status(:success)
    expect(response.body.size).to eq(2)
  end

end
