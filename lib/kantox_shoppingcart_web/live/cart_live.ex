defmodule KantoxShoppingcartWeb.CartLive do
  use Phoenix.LiveView
  alias KantoxShoppingcart.Cart

  @provitional_store %{
    "GR1" => %{:name => "Green tea", :price => 311, :discount => BuyOneGetOne},
    "SR1" => %{:name => "Strawberries", :price => 500, :discount => Percentage},
    "CF1" => %{:name => "Coffee", :price => 1123, :discount => TwoThirds}
  }
  @impl true
  def mount(params, _, socket) do
    ticket = %{
      :total => "0.0",
      :products => @provisional_store
    }

    {:ok, assign(socket, :products, ticket.products) |> assign(:total, ticket.total)}
  end

  def render(assigns) do
    ~H"""
    <!-- component -->
    <div class="p-5">
      <div class="flex h-64 justify-center">
        <div class="relative ">
          <div class="flex flex-row cursor-pointer truncate p-2 px-4  rounded">
            <div></div>
            <div class="flex flex-row-reverse ml-2 w-full">
              <div slot="icon" class="relative">
                <div class="absolute text-xs rounded-full -mt-1 -mr-2 px-1 font-bold top-0 right-0 bg-red-700 text-white">
                  3
                </div>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="100%"
                  height="100%"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  class="feather feather-shopping-cart w-6 h-6 mt-2"
                >
                  <circle cx="9" cy="21" r="1"></circle>
                  <circle cx="20" cy="21" r="1"></circle>
                  <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                </svg>
              </div>
            </div>
          </div>
          <div class="absolute w-full  rounded-b border-t-0 z-10">
            <div class="shadow-xl w-64">
              <div
                :for={product <- @products}
                id="product-#{product.id}"
                class="p-2 grid grid-cols-3 gap-1 bg-white hover:bg-gray-100 cursor-pointer border-b border-gray-100"
                style=""
              >
                <div class="p-2 col-1">
                  <img
                    src="https://dummyimage.com/50x50/bababa/0011ff&amp;text=50x50"
                    alt="img product"
                  />
                </div>
                <div class="flex-auto col-3 text-sm ">
                  <div class="font-bold"><%= product.name %></div>
                </div>
                <div class="flex flex-col col-2 font-medium items-end">
                  <div class="w-4 h-4 mb-6 hover:bg-gray-200 text-gray-700">
                    <%= product.price %>
                  </div>
                </div>
                <div class="col-span-2">
                  <div class="relative flex items-center max-w-[8rem]">
                    <button
                      phx-click={:dec}
                      phx-value={product.id}
                      type="button"
                      class="bg-gray-100 dark:bg-gray-400 dark:hover:bg-gray-300 dark:border-gray-300 hover:bg-gray-100 border border-gray-200 rounded-s-lg p-3 h-11 focus:ring-gray-100 dark:focus:ring-gray-700 focus:ring-2 focus:outline-none"
                    >
                      <svg
                        class="w-3 h-3 text-gray-900 dark:text-white"
                        aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 18 2"
                      >
                        <path
                          stroke="currentColor"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M1 1h16"
                        />
                      </svg>
                    </button>
                    <span
                      type="text"
                      aria-describedby="helper-text-explanation"
                      class="bg-gray-50 border-x-0 border-gray-300 h-11 text-center text-gray-400 text-sm focus:ring-blue-300 focus:border-blue-300 block w-full py-2.5 dark:bg-gray-400 dark:border-gray-300 dark:placeholder-gray-200 dark:text-white dark:focus:ring-blue-200 dark:focus:border-blue-200"
                      required
                    >
                      <%= product.quantity %>
                    </span>
                    <button
                      phx-click={:inc}
                      phx-value={product.id}
                      type="button"
                      class="bg-gray-100 dark:bg-gray-400 dark:hover:bg-gray-300 dark:border-gray-300 hover:bg-gray-100 border border-gray-200 rounded-e-lg p-3 h-11 focus:ring-gray-100 dark:focus:ring-gray-400 focus:ring-2 focus:outline-none"
                    >
                      <svg
                        class="w-3 h-3 text-gray-900 dark:text-white"
                        aria-hidden="true"
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 18 18"
                      >
                        <path
                          stroke="currentColor"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M9 1v16M1 9h16"
                        />
                      </svg>
                    </button>
                  </div>
                </div>
                <div class="col-span-1 items-end">
                  <%= @total %>
                </div>
              </div>

              <div class="p-4 justify-center flex">
                <button class="text-base  undefined  hover:scale-110 focus:outline-none flex justify-center px-4 py-2 rounded font-bold cursor-pointer 
        hover:bg-teal-700 hover:text-teal-100 
        bg-teal-100 
        text-teal-700 
        border duration-200 ease-in-out 
        border-teal-600 transition">
                  Checkout <%= @total %>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="h-32"></div>
    </div>
    """
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("inc", params, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("dec", params, socket) do
    {:noreply, socket}
  end
end
