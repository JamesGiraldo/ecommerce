class FavoritesController < ApplicationController
  def create
    # Agregar a favoritos
    favorite = Favorite.new(product_id: params[:product_id], user_id: current_user.id)
    favorite.set_product(params[:product_id], current_user.id)
    if favorite.save
      @response = "Guardamos el Producto En Favoritos"
      render json: {response: @response}
    else
      render json: favorite.errors, status: 400
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    product = favorite.product
    response = "#{product.p_name.upcase} Ha Sido Eliminado De Favoritos"
    favorite.destroy
    render json: {response: response}
  end
end
