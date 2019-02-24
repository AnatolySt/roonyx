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
    if params.has_key?(:from) && params.has_key?(:to)
      @start_date = params[:from]
      @end_date = params[:to]
    else
      render json: { error: 'You must set start and end dates!' }, status: 422
    end
  end

end