class SalesController < ApplicationController

  before_action :set_goods
  before_action :sales_params, only: [:index, :refresh]

  def index
  end

  def table
    @default_date = Date.new(2017, 03, 01)
  end

  def refresh
  end

  private

  def set_goods
    @goods = Good.all
  end

  def sales_params
    @start_date = params[:from]
    @end_date = params[:to]
  end

end