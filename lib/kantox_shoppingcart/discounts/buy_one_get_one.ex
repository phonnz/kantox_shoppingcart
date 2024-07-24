defmodule KantoxShoppingCart.Discounts.BuyOneGetOne do
  @behaviour KantoxShoppingCart.Discounts.Discount
  @at_least 2

  @impl true
  def maybe_discount(%{:quantity => quantity} = cart_item) when quantity > @at_least do
    Map.put(cart_item, :subtotal, apply_discount(quantity, cart_item.price))
  end

  @impl true
  def maybe_discount(%{:quantity => quantity, :price => price} = cart_item) do
    Map.put(cart_item, :subtotal, net_subtotal(quantity, price))
  end

  def apply_discount(quantity, price) do
    quantity_to_charge = quantity - div(quantity, @every)
    net_subtotal(quantity_to_charge, price)
  end

  def net_subtotal(quantity, price) do
    quantity * price
  end

  @impl true
  def explain() do
    """
    Every time a customer buys one product
    with this discount, will have one free
    """
  end
end
