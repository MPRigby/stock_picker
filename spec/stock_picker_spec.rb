#spec/stock_picker_spec.rb
require "stock_picker"

describe ".pick_stock" do

  context "given an empty array" do
    it "returns [0,0]: do not buy" do
      expect(pick_stock([])).to eql([0,0])
    end
  end

  context "given an array with one value" do
    it "returns [0,0]: do not buy" do
      expect(pick_stock([5])).to eql([0,0])
    end
  end

  context "given an array with two values, where second price exceeds first" do
    it "returns [0,1]: buy on 0th day, sell on 1st day" do
      expect(pick_stock([4, 10])).to eql([0,1])
    end
  end

  context "given an array with two values, where first price exceeds second" do
    it "returns [0,0]: do not buy" do
      expect(pick_stock([10, 4])).to eql([0,0])
    end
  end

  context "given many values, where profit is possible" do
    it "returns buy and sell days with highest profit" do
      expect(pick_stock([2, 4, 6, 8, 10, 12])).to eql([0,5])
    end
  end

  context "given many values, where profit is not possible" do
    it "returns [0,0]: do not buy" do
      expect(pick_stock([12, 10, 8, 6, 4, 2])).to eql([0,0])
    end
  end

  context "given many values, where lowest price is last value and therefore cannot be the purchase price" do
    it "returns days with highest possible profit margin" do
      expect(pick_stock([4, 5, 3, 8, 9, 12, 1])).to eql([2,5])
    end
  end

  context "given many values, where highest price is first value and therefore cannot be the sale price" do
    it "returns days with highest possible profit margin" do
      expect(pick_stock([25, 15, 2, 3, 5, 4, 2])).to eql([2,4])
    end
  end

  context "given many values, where where highest profit margin can be achieved before the lowest price day" do
    it "returns days with highest possible profit margin" do
      expect(pick_stock([2, 15, 1, 5])).to eql([0, 1])
    end
  end

end
