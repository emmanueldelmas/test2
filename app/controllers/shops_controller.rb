class ShopsController < ApplicationController
  def index
    @shops = Shop.all.to_a
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
