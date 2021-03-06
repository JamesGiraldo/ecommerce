class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /products
  # GET /products.json
  def index
    @products = Product.all.paginate(page: params[:page], per_page: 6)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.new(product_params)
    @product.categories = params[:categories]
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Producto #{@product.p_name.upcase} Registrado Correntamente.!"  }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Producto #{@product.p_name.upcase} Actualizado Correntamente.!" }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if @product.destroy
      respond_to do |format|
        format.html { redirect_to products_path, alert: "Producto #{@product.p_name.upcase}  Eliminado Correntamente.!" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to products_path, notice: "Problemas Con La Grabacion.!" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      begin
        @product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: "Este Producto Ya No Existe"
      end
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:p_name, :p_description, :categories, 
                                      :p_price, :p_quantify, :p_send,
                                      :p_avaliable, :user_id)
    end
end
