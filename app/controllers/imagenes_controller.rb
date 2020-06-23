class ImagenesController < ApplicationController
  # before_action :set_imagen, only: [:edit, :update, :destroy]
  load_and_authorize_resource
  before_action :set_product

  def new
    @imagen = Imagen.new
  end

  def edit
  end

  def create
    @imagen = @product.imagenes.new(imagen_params)
    respond_to do |format|
      if @imagen.save
        format.html { redirect_to @imagen.product, notice: "Imgen Asignada Correctamente!" }
        format.json { render :show, status: :created, location: @imagen }
      else
        format.html { render :new }
        format.json { render json: @imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @imagen.update(imagen_params)
        format.html { redirect_to @imagen.product, notice: "Imagen Actualizada Correctamente!" }
        format.json { render :show, status: :ok, location: @imagen.product }
      else
        format.html { render :edit }
        format.json { render json: @imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @imagen.destroy
    respond_to do |format|
      format.html { redirect_to @product, alert: "Imagen Eliminada Correctamente!" }
      format.json { head :no_content }
    end
  end

  private

  def set_imagen
    @imagen = Imagen.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def imagen_params
    params.require(:imagen).permit(:title, :description, :avatar)
  end

end
