class ShopsController < ApplicationController
  def index
    @distance = params[:distance].to_i if params[:distance].to_i != 0
    @limit = params[:limit].to_i if params[:limit].to_i != 0
    if @limit
      @shops = Shop.closest( params[:position], @limit, @distance || 50)
    elsif @distance
      @shops = Shop.around( params[:position], @distance)
    else
      @shops = Shop.all.to_a
    end
  end

  def new
    @shops = Shop.new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def delete
  end
  
  private
end
