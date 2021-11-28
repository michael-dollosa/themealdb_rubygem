require 'spec_helper'

RSpec.describe "Free User Endpoints" do
  before(:each) do
    @client = ThemealdbRubygem::Client.new
  end

  it "Searches by name" do
    response = @client.search_by_name("Arrabiata")
    expect(response[:code]).to eq(200)
  end

  it "Searches by first letter" do
    response = @client.search_by_first_letter("a")
    expect(response[:code]).to eq(200)
  end

  it "Searches by id" do
    response = @client.search_by_id("52772")
    expect(response[:code]).to eq(200)
  end

  it "Searches random meal" do
    response = @client.random_meal
    expect(response[:code]).to eq(200)
  end

  it "Lists categories with full description" do
    response = @client.list_categories_full
    expect(response[:code]).to eq(200)
  end

  it "Lists all categories" do
    response = @client.list_categories
    expect(response[:code]).to eq(200)
  end

  it "Lists all areas" do
    response = @client.list_areas
    expect(response[:code]).to eq(200)
  end

  it "Lists all ingrdients" do
    response = @client.list_ingredients
    expect(response[:code]).to eq(200)
  end

  it "Filters by main ingrdient" do
    response = @client.filter_by_main_ingredient("chicken breast")
    expect(response[:code]).to eq(200)
  end

  it "Filters by category" do
    response = @client.filter_by_category("Seafood")
    expect(response[:code]).to eq(200)
  end

  it "Filters by area" do
    response = @client.filter_by_area("Canadian")
    expect(response[:code]).to eq(200)
  end



  

end
