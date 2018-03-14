class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  def self.search(search_term)
    if Rails.env.production?
      Product.where("name ILIKE ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def views
    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  end

  def viewed
    $redis.incrby("product:#{id}", 1) # this is equivalent to 'INC product:1'
  end

end
