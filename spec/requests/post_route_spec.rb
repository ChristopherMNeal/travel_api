require 'rails_helper'

describe "post a review route", :type => :request do

  before do
    post '/reviews', params: { :author => "Emily", :content => "Mamma mia", :rating => 5, :landmark => 'statue', :city => 'Paris', :country => 'England' }
  end
  it 'returns the review author' do
    expect(JSON.parse(response.body)['author']).to eq('Emily')
  end
  it 'returns the review content' do
    expect(JSON.parse(response.body)['content']).to eq('Mamma mia')
  end
  it 'returns the review rating' do
    expect(JSON.parse(response.body)['rating']).to eq(5)
  end
  it 'returns the review name' do
    expect(JSON.parse(response.body)['landmark']).to eq('statue')
  end

  it 'returns the review city' do
    expect(JSON.parse(response.body)['city']).to eq('Paris')
  end

  it 'returns the review country' do
    expect(JSON.parse(response.body)['country']).to eq('England')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
