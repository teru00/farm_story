class StaticPagesController < ApplicationController
  def home
    render text: 'hello, consumer!'
  end
end
