defmodule KantoxShoppingcart.Products do
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
end
