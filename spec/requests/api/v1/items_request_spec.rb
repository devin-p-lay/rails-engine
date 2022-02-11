require 'rails_helper'

describe 'The Items API' do
  it 'can get all of the items' do
    create_list(:item, 3)
    get '/api/v1/items'

    body = JSON.parse(response.body, symbolize_names: true)
    items = body[:data]

    expect(response).to be_successful
    expect(items.count).to eq(3)

    items.each do |item|
      expect(item[:id]).to be_an String
      expect(item[:attributes][:name]).to be_a String
      expect(item[:attributes][:description]).to be_a String
      expect(item[:attributes][:unit_price]).to be_a Float
    end
  end

  context 'show' do
    it 'can get a specific item' do
      merchant = create :merchant
      item1 = create :item, { merchant_id: merchant.id }
      get "/api/v1/items/#{item1.id}"
      expect(response).to be_successful

      parsed = JSON.parse(response.body, symbolize_names: true)
      item = parsed[:data]
      expect(item[:id]).to be_an String
      expect(item).to have_key(:attributes)
      expect(item[:attributes][:name]).to be_a String
      expect(item[:attributes][:description]).to be_a String
      expect(item[:attributes][:unit_price]).to be_a Float
    end

    describe 'sad paths' do
      it 'returns error if no item' do
        id = create(:item).id

        get "/api/v1/items/#{id + 1}"

        parsed = JSON.parse(response.body, symbolize_names: true)
        item = parsed[:data]

        expect(item).to eq({ details: 'No item matches this id' })
      end
    end
  end

  it 'can create a new item' do
    merchant = create(:merchant)
    item_params = { name: 'cool item', unit_price: 5, description: 'pretty cool', merchant_id: merchant.id}

    post "/api/v1/items", params: item_params
    expect(response).to be_successful

    item = Item.last
    expect(item.name).to eq 'cool item'
    expect(item.unit_price).to eq 5
    expect(item.description).to eq 'pretty cool'
    expect(item.merchant_id).to eq merchant.id
  end

  context 'update' do
    it 'can update an item' do
      item = create :item, { name: 'test item' }
      put "/api/v1/items/#{item.id}", params: {name: 'real item'}
      expect(response).to be_successful
      expect(Item.last.name).to eq 'real item'
    end
  end

  it 'can delete an item' do
    item = create :item
    delete "/api/v1/items/#{item.id}"
    expect(response).to be_successful
  end

  it 'can get merchant data for a given item' do
    merchant = create :merchant
    item = create :item, {merchant_id: merchant.id}
    get "/api/v1/items/#{item.id}/merchant"
    expect(response).to be_successful
  end

  describe 'Search Items' do
    it 'can find one item by name search' do
      merchant = create(:merchant)
      item1 = create(:item, name: 'Veganaise', merchant_id: merchant.id)
      item2 = create(:item, name: 'Vegan Toothpaste', merchant_id: merchant.id)
      item3 = create(:item, name: 'Plant Based Sandals', merchant_id: merchant.id)
      item4 = create(:item, name: 'Vitamins for vegans', merchant_id: merchant.id)
      name = 'Vegan'
      get "/api/v1/items/find?name=#{name}"

      parsed = JSON.parse(response.body, symbolize_names: true)
      item = parsed[:data]
      expect(response).to be_successful

      expect(item[:attributes][:name]).to eq(item2.name)
    end

    it 'returns an error if there are no matches' do
      merchant = create(:merchant)
      item1 = create(:item, name: 'Veganaise', merchant_id: merchant.id)
      item2 = create(:item, name: 'Vegan Toothpaste', merchant_id: merchant.id)
      item3 = create(:item, name: 'Plant Based Sandals', merchant_id: merchant.id)
      item4 = create(:item, name: 'Vitamins for vegans', merchant_id: merchant.id)
      name = 'vgan'
      get "/api/v1/items/find?name=#{name}"

      parsed = JSON.parse(response.body, symbolize_names: true)
      item = parsed[:data]

      expect(item).to eq({ error: 'No item matches search parameters' })
    end
  end
end


