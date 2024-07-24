# KantoxShoppingcart
This a simple cashier system that adds products to a cart and displays the total price.

Notes:
- This implementation might seems overengineering but it aims to showoff Elixir and OTP knowledge 
- It is implementing behaviours to show how decorator and factories can work in functinoal programming 
- It's using a simple UI to demostrate the simplicity of real-time with Liveview
- It is using Money lib in order to improve currencies management 
** It is not managing sessions, so it is only possible to work with one shopping cart.
** It has hardcoded products for fast development purposes
** It has few tests but very focused in the special cases for discounts.

### products
  Product Code | Name         | Price  |
   ----------------------------- --------
   GR1          | Green tea    | £3.11  |
   SR1          | Strawberries | £5.00  |
   CF1          | Coffee       | £11.23 |

### discounts
- buy-one-get-one-free for green tea.
- Buying  3 or more strawberries, the price should drop to £4.50 per strawberry.
- Buying 3 or more coffees, the price of all coffees should drop to two thirds of the original price.



To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * Run `mix test` in order to see how testing coverage is working.

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

