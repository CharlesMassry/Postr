class FrontPagesController < ApplicationController
  skip_before_filter :require_login
  def show

  end
end
