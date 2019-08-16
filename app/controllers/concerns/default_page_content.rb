module DefaultPageContent
  extend ActiveSupport::Concern

  included do
      before_action :set_page_defaults
  end



  def set_page_defaults
    @page_title = "Devcamp DevcampPortfolio | My Portfolio Website"
    @seo_keywords = "Terence Boyle Portfolio"
  end
end
