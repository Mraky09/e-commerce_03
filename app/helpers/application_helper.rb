module ApplicationHelper
  def full_title page_title = ""
    base_title = "E-Commerce"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
