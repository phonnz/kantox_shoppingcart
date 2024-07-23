defmodule KantoxShoppingcart.Cart.CartBasicTest do
  use ExUnit.Case, async: true
  alias KantoxShoppingcart.Cart

  describe "Test no discount combinations" do
    test "Basket: GR1" do
      product_codes = ["GR1"]
      assert Cart.compute(product_codes).total == "£3.11"
    end

    test "Basket: SR1" do
      product_codes = ["SR1"]
      assert Cart.compute(product_codes).total == "£5.00"
    end

    test "Basket: CF1" do
      product_codes = ["CF1"]
      assert Cart.compute(product_codes).total == "£11.23"
    end

    test "Basket: GR1,SR1,CF1" do
      product_codes = ["GR1", "SR1", "CF1"]
      assert Cart.compute(product_codes).total == "£19.34"
    end

    test "Basket: GR1,SR1" do
      product_codes = ["GR1", "SR1"]
      assert Cart.compute(product_codes).total == "£8.11"
    end

    test "Basket: SR1,CF1" do
      product_codes = ["SR1", "CF1"]
      assert Cart.compute(product_codes).total == "£16.23"
    end

    test "Basket: GR1,CF1" do
      product_codes = ["GR1", "CF1"]
      assert Cart.compute(product_codes).total == "£14.34"
    end
  end
end
