module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
     "https://place-hold.it/#{height}x#{width}"
  end

  def self.lorem_ipsum_gen(repeat:)
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." * repeat
  end

  def self.title_gen(title_num:)
      "Test Title #{title_num}"
  end
end
