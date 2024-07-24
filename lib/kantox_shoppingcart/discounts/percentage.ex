defmodule KantoxShoppingcart.Discounts.Percentage do
  @behaviour KantoxShoppingCart.Discount.Discount

  @at_least_items 3
  @discount_percentage 10

  @impl true
  def maybe_discount(%{:quantity => quantity} = cart_item) when quantity >= @at_least_items do
    Map.put(cart_item, :subtotal, round(apply_discount(quantity, cart_item.price)))
  end

  @impl true
  def maybe_discount(%{:quantity => quantity, :price => price} = cart_item) do
    Map.put(cart_item, :subtotal, net_subtotal(quantity, price))
  end

  @impl true
  def explain() do
    """
    @at_least items of the same product 
    will give @discount_percentage
    discount for every item
    """
  end

  def apply_discount(quantity, price) do
    net_subtotal(quantity, price) - net_subtotal(quantity, price) * @discount_percentage * 0.01
  end

  def net_subtotal(quantity, price) do
    quantity * price
  end
end
