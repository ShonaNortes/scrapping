require_relative '../lib/scrapping01.rb'

describe "scrap function" do
    it "result empty?" do
      expect(scrap_function).to eq(true)
    end
  end