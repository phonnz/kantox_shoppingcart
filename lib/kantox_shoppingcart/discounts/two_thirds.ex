defmodule KantoxShoppingCart.Discounts.TwoThirds do
  @behaviour KantoxShoppingCart.Discounts.Discount
  @at_least 3

  @impl true
  def maybe_discount(%{:quantity => quantity} = cart_item) when quantity > @at_least do
    Map.put(cart_item, :subtotal, apply_discount(quantity, cart_item.price))
  end

  @impl true
  def maybe_discount(%{:quantity => quantity, :price => price} = cart_item) do
    Map.put(cart_item, :subtotal, net_subtotal(quantity, price))
  end

  def apply_discount(quantity, price) do
    net_subtotal(quantity, price) * 2 / 3
  end

  def net_subtotal(quantity, price) do
    quantity * price
  end

  @impl true
  def explain() do
    """
    Every time a customer buys three items of 
    the same product it gets 2/3 of price
    """
  end
end
