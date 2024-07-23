defmodule KantoxShoppingcart.Cart do
  defstruct amount: 0, products: %{}

  @moduledoc """
  This module holds the public API for Cart actions.

  ## This are the existent products for the Tech Evaluation purpose
  #
  # Product Code | Name         | Price  |
  # ----------------------------- --------
  # GR1          | Green tea    | £3.11  |
  # SR1          | Strawberries | £5.00  |
  # CF1          | Coffee       | £11.23 |

  """
  @provitional_store %{
    "GR1" => %{:name => "Green tea", :price => 311},
    "SR1" => %{:name => "Strawberries", :price => 500},
    "CF1" => %{:name => "Coffee", :price => 1123}
  }

  def new, do: __MODULE__.__struct__()

  def compute(product_codes) when is_list(product_codes) do
    product_codes
    |> Enum.reduce(__MODULE__.new(), &add(&2, &1))
    |> set_amount()
  end

  def add(%{:products => products} = cart, product_code) do
    Map.put(cart, :products, Map.update(products, product_code, 1, &(&1 + 1)))
  end

  defp set_amount(cart) do
    Map.put(cart, :amount, compute_total(cart.products))
  end

  defp compute_total(products) do
    products
    |> Enum.map(&compute_single_product_amount/1)
    |> Enum.reduce(0, &(&2 + &1))
  end

  defp compute_single_product_amount({product_key, quantity}) do
    @provitional_store
    |> get_in([product_key, :price])
    |> Kernel.*(quantity)
  end
end
