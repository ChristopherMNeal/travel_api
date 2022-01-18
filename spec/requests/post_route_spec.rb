require 'rails_helper'

describe "post a review route", :type => :request do

  before do
    post '/reviews', params: { :name => 'statue', :city => 'Paris', :country => 'England' }
  end

  it 'returns the review name' do
    expect(JSON.parse(response.body)['name']).to eq('statue')
  end

  it 'returns the destination city' do
    expect(JSON.parse(response.body)['city']).to eq('Paris')
  end

  it 'returns the destination country' do
    expect(JSON.parse(response.body)['country']).to eq('England')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
