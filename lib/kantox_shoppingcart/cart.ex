defmodule KantoxShoppingcart.Cart do
  defstruct amount: 0, products: %{}

  @moduledoc """
  This module holds the public API for Cart actions.
  ,
  ## This are the existent products for the Tech Evaluation purpose
  #
  # Product Code | Name         | Price  |
  # ----------------------------- --------
  # GR1          | Green tea    | £3.11  |
  # SR1          | Strawberries | £5.00  |
  # CF1          | Coffee       | £11.23 |

  """
  alias KantoxShoppingcart.Discounts.{BuyOneGetOne, Percentage, TwoThirds}
  alias KantoxShoppingcart.Cart.CartItem

  @provitional_store %{
    "GR1" => %{:name => "Green tea", :price => 311, :discount => BuyOneGetOne},
    "SR1" => %{:name => "Strawberries", :price => 500, :discount => Percentage},
    "CF1" => %{:name => "Coffee", :price => 1123, :discount => TwoThirds}
  }

  def new do
    __MODULE__.__struct__()
  end

  def compute(product_codes) when is_list(product_codes) do
    product_codes
    |> Enum.reduce(__MODULE__.new(), &add(&2, &1))
    |> set_amount()
  end

  def add(%__MODULE__{:products => products} = cart, product_code, quantity \\ 1) do
    Map.put(cart, :products, Map.update(products, product_code, 1, &(&1 + quantity)))
  end

  def substract(%__MODULE__{:products => products} = cart, product_code, quantity \\ 1) do
    Map.put(cart, :products, remove(products, product_code, quantity))
  end

  defp remove(products, product_to_decrement, _quantity) do
    Map.put(
      products,
      product_to_decrement,
      products
      |> Map.get(product_to_decrement)
      |> decrement()
    )
  end

  defp decrement(value) when value > 0, do: value - 1
  defp decrement(_value), do: 0

  defp set_amount(cart) do
    cart
    |> Map.put(:amount, compute_total(cart.products))
    |> set_string_amount
  end

  defp set_string_amount(%__MODULE__{} = cart) do
    string =
      cart
      |> Map.get(:amount)
      |> Money.to_string()

    Map.put(cart, :total, string)
  end

  defp compute_total(products) do
    products
    |> Enum.map(&compute_single_product_amount/1)
    |> Enum.reduce(0, &(&2 + &1.subtotal))
    |> Money.new()
  end

  defp compute_single_product_amount({product_key, quantity}) do
    module = Map.get(@provitional_store, product_key)

    module.discount.maybe_discount(Map.put(module, :quantity, quantity))
  end
end
