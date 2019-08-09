require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef")}
  subject(:cake) { Dessert.new("cake", 1, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(cake.quantity).to eq(1)
    end
    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "3", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cake.add_ingredient("eggs")).to eq(["eggs"])
    end
  end

  describe "#mix!" do
      before(:each) do
        cake.add_ingredient("flour")
        cake.add_ingredient("egg")
        cake.add_ingredient("milk")
      end
    it "shuffles the ingredient array" do
      original_ingredients = cake.ingredients.dup
      expect(cake.mix!).to_not eq(original_ingredients)
      expect(cake.mix!).to be(cake.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      old_quantity = cake.quantity
      expected_quantity = old_quantity - 1
      expect(cake.eat(1)).to eq(expected_quantity)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(10000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Gordon the Great Baker")
      expect(cake.serve).to include("#{chef.titleize} has made #{cake.quantity} #{cake.type.pluralize}!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).and_return(400)
      expect(cake.make_more).to eq(400)
    end
  end
end
