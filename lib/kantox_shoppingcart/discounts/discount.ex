defmodule KantoxShoppingCart.Discounts.Discount do
  @callback maybe_discount() :: {:ok, cart_item :: term} | {:error, cart_item :: term}
  @callback explain() :: {:ok, explanation :: String.t()}
end
