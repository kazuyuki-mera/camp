class RankingController < ApplicationController
  def index
    product_ids = Review.group(:product_id).order('average_rate DESC').limit(5).average(:rate).keys
    @ranking = product_ids.map { |id| Product.find(id) }
  end
end
