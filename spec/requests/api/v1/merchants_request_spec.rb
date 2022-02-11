require 'rails_helper'

describe 'The Merchants API' do
  it 'sends a list of merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    parsed = JSON.parse(response.body, symbolize_names: true)
    merchants = parsed[:data]

    expect(response).to be_successful
    expect(merchants.count).to eq(3)

    merchants.each do |merchant|
      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to be_an String

      expect(merchant).to have_key(:attributes)
      expect(merchant[:attributes][:name]).to be_a String
    end
  end

  context 'show' do
    it 'can return a specific merchant' do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(merchant).to have_key(:id)
      expect(merchant[:id]).to eq(id)

      expect(merchant).to have_key(:name)
      expect(merchant[:name]).to be_a String
    end

    describe 'sad paths' do
      it 'returns error if no merchant' do
        id = create(:merchant).id

        get "/api/v1/merchants/#{id + 1}"

        parsed = JSON.parse(response.body, symbolize_names: true)
        merchant = parsed[:data]

        expect(merchant).to eq({ details: 'No merchant matches this id' })
      end
    end
  end

  describe 'merchant items' do
    it 'can return all merchant items' do
      merchant = create :merchant
      merchant_decoy = create :merchant
      item1 = create :item, { merchant_id: merchant.id }
      item2 = create :item, { merchant_id: merchant.id }
      item_decoy = create :item, { merchant_id: merchant_decoy.id }

      get "/api/v1/merchants/#{merchant.id}/items"

      parsed = JSON.parse(response.body, symbolize_names: true)
      items = parsed[:data]
      expect(response).to be_successful
      expect(merchant.items.count).to eq(2)

      items.each do |item|
        expect(item[:id]).to be_an String
        expect(item).to have_key(:attributes)
        expect(item[:attributes]).to be_a Hash
        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a String
      end
    end

    describe 'sad paths' do
      it 'returns 404 if no items are found' do
        merchant = create :merchant
        get "/api/v1/merchants/#{merchant.id}/items"

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(parsed_response).to have_key(:errors)
        expect(parsed_response[:errors][:details]).to eq("No items were found for merchant with id: #{merchant.id}")
      end
    end
  end

  describe 'search find all merchants' do
    it 'can find all merchants by name' do
      merchant1 = Merchant.create!(name: "Vegan Treats")
      merchant2 = Merchant.create!(name: 'Plant Based')
      merchant3 = Merchant.create!(name: "All Vegan Eats")
      name = 'Vegan'
      get "/api/v1/merchants/find_all?name=#{name}"

      parsed = JSON.parse(response.body, symbolize_names: true)
      merchant = parsed[:data]
      expect(response).to be_successful

      expect(merchant.first[:attributes][:name]).to eq(merchant3.name)
      expect(merchant.second[:attributes][:name]).to eq(merchant1.name)
    end

    it 'gives an error if there are no matches for all' do
      merchant1 = Merchant.create!(name: "Vegan Treats")
      merchant2 = Merchant.create!(name: 'Plant Based')
      merchant3 = Merchant.create!(name: "All Vegan Eats")
      name = 'asdf'
      get "/api/v1/merchants/find_all?name=#{name}"

      parsed = JSON.parse(response.body, symbolize_names: true)
      merchant = parsed[:data]

      expect(merchant).to eq([])
    end
  end
end
