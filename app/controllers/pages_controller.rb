class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :contact, :about]

  def home
  end

  def dashboard
  end

  def contact
  end

  def about
    @test = Artwork.first
  end
end
