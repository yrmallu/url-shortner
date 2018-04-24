require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'is not valid without attributes' do
    expect(Url.new).to_not be_valid
  end

  it 'is valid with valid attributes' do
    url = Url.new url: 'https://example.com', url_id: 'J8kdSd', status: false
    expect(url).to be_valid
  end

  it 'is not valid without url' do
    url = Url.new url: nil, url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
  end

  it 'is not valid if it is not start with http or https' do
    url = Url.new url: 'ftp://example.com', url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
    url = Url.new url: 'http.example.com', url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
    url = Url.new url: 'http//example.com', url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
    url = Url.new url: 'https:/example.com', url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
  end

  it 'is not valid if user add another type of data' do
    url = Url.new url: 'lorem', url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
    url = Url.new url: '3', url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
    url = Url.new url: 3, url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
    url = Url.new url: false, url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
    url = Url.new url: 'SELECT * FROM url', url_id: 'J8kdSd', status: false
    expect(url).to_not be_valid
  end

  it 'is not valid without url_id' do
    url = Url.new url: 'https://example.com', url_id: nil, status: false
    expect(url).to_not be_valid
  end

  it 'is not valid without status' do
    url = Url.new url: 'https://example.com', url_id: 'J8kdSd', status: nil
    expect(url).to_not be_valid
  end

  # TODO: It is not working. Check model again.

  it 'is valid, if status is equal false (meaning public)' do
    url = Url.new url: 'https://example.com', url_id: 'J8kdSd', status: false
    expect(url).to be_valid
  end

  it 'is valid, if status is equal true (meaning private)' do
    url = Url.new url: 'https://example.com', url_id: 'J8kdSd', status: true
    expect(url).to be_valid
  end
end
