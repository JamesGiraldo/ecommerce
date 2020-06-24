class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @products = Product.all.paginate(page: params[:page], per_page: 6)
  end

  def purchases
  end

  def history
  end

  def favorites
  end
  def search
    @products = Product.where("p_name LIKE :query", query: "%#{params[:find]}%").paginate(page: params[:page], per_page: 6)
  end
end
