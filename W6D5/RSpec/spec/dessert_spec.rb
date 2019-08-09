require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end



describe Dessert do
  let(:chef) { double("chef")}
  let(:dessert) { Dessert.new("cake", 1, "chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(1)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "3", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("eggs")
      expect(dessert.ingredients).to eq(["eggs"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      original_ingredients = dessert.dup
      dessert.mix!
      expect(dessert.ingredients).to_not eq(original_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      old_quantity = dessert.quantity
      expected_quantity = old_quantity - 1
      dessert.eat(1)
      expect(dessert.quantity).to eq(expected_quantity)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(10000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("Chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:make_more).and_return(400)
    end
  end
end
