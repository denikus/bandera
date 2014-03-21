class PagesController < ApplicationController
  def about
    render "about_#{I18n.locale}"
  end
end
