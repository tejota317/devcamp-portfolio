module ApplicationHelper

  def login_helper style=nil
    if current_user.is_a?(GuestUser)
     (link_to "Register", new_user_registration_path, class: style) +
     " ".html_safe +
     (link_to "Login", new_user_session_path, class: style)
   else
     link_to "Logout", destroy_user_session_path, method: :delete, class: style
   end
  end

  def source_helper(layout_name)
    if session[:source]
    greeting = "Thanks for visiting from #{session[:source]} on layout: #{layout_name}"
    content_tag(:p, greeting, class: "source-greeting" )
    end
  end

  def copyright_generator
    @copyright = TejotaViewTool::Renderer.copyright "Terry Boyle", "All rights reserved"
  end

  def nav_active path
    "active" if current_page? path
    # How I did this previously
    #if params[:action] == page
    #  "active"
    #end
  end

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_path,
        title: "About Me"
      },
      {
        url: contact_path,
        title: "Contact"
      },
      {
        url: blogs_path,
        title: "Blog"
      },
      {
        url: portfolios_path,
        title: "Portfolio"
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{nav_active item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

end
