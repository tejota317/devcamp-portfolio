class Portfolio < ApplicationRecord

  validates_presence_of :title, :body, :main_image, :thumb_image

  #One way of defining a custom scope
  def self.angular
    where(subtitle: "Angular")
  end
   #Another way of defining a custom scope
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails") }
end
