class PagesController < ApplicationController
  def home
    @gotolinks = Gotolink.all
  end
end
