require_relative '../lib/crypto'

describe "#currency_name" do 
    
    it "Includes at least 3 cryptocurrencies" do 
        expect(currency_name.find { |item| item[:id] == BTC }).to_not be_nil
    end 
    
end 