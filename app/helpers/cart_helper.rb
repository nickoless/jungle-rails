module CartHelper
  def show_cart
    if cart.empty?
      render :partial => "empty_cart"
    else
      render :partial => "show_cart"
    end
  end
end
