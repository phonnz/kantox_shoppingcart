defmodule KantoxShoppingcart.Cart do
  defstruct amount: 0, products: []

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
  def compute(_product_codes) do
    0
  end
end
