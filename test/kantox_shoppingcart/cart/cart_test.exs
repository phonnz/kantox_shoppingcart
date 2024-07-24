defmodule KantoxShoppingcart.Cart.CartTest do
  use ExUnit.Case, async: true
  alias KantoxShoppingcart.Cart

  describe "Test Discounts" do
    test "Basket: GR1,SR1,GR1,GR1,CF1" do
      product_codes = ["GR1", "SR1", "GR1", "GR1", "CF1"]
      assert Cart.compute(product_codes).total == "£22.45"
    end

    test "Basket: GR1,GR1" do
      product_codes = ["GR1", "GR1"]
      assert Cart.compute(product_codes).total == "£3.11"
    end

    test "Basket: SR1,SR1,GR1,SR1" do
      product_codes = ["SR1", "SR1", "GR1", "SR1"]
      assert Cart.compute(product_codes).total == "£16.61"
    end

    test "Basket: GR1,CF1,SR1,CF1,CF1" do
      product_codes = ["GR1", "CF1", "SR1", "CF1", "CF1"]
      assert Cart.compute(product_codes).total == "£30.57"
    end
  end
end
