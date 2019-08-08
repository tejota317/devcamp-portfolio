class Blog < ApplicationRecord
  include Placeholder
  enum status: { draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic

  #creating a default value
  after_initialize :set_defaults

  def set_defaults
    self.body ||= Placeholder.lorem_ipsum_gen(repeat: 1)

  end

end
