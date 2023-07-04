class PagesController < ApplicationController
  def index
  end

  def about
    @title = 'About Application'
  end

  def framework
    @title = 'Ruby and Rails versions'
  end
end
