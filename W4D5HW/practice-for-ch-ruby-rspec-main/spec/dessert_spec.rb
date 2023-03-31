require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("cake", 5, chef) }
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("cake", 5.0, chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("sugar")
      expect(dessert.ingredients).to_not eq([])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("sugar")
      # dessert.add_ingredient("flour")
      # dessert.add_ingredient("eggs")
      preshuffle = dessert.dup
      expect(dessert.mix!).to_not eq(preshuffle) #Why...? With just one ingredient, they should eq
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end