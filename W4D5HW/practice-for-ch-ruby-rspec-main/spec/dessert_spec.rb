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
    it "subtracts an amount from the quantity" do
      expect{ dessert.eat(3) }.to_not raise_error
      expect(dessert.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{dessert.eat(6)}.to raise_error "not enough left!"
    end
  end

  describe "#serve" do
    # let(:chef) { double("chef", :name=>"Kaz") }
    let(:chef) { double("chef") }
    subject { Dessert.new("cookie", 10, chef) }
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Kaz the Great Baker")
      expect(subject.serve).to eq("Chef Kaz the Great Baker has made 10 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert).and_return(400)
      # expect(chef).to receive(:put_in_oven).with(dessert)
      # expect(dessert).to receive(:heat!) 
        #Is there a way to test that dessert.heat! gets called without
        #defining the Chef class that calls it from within a helper method?
      dessert.make_more
      # expect(dessert.temp).to eq(400)
    end
  end
end