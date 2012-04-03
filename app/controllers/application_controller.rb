class ApplicationController < ActionController::Base
  protect_from_forgery

  TYPES = %w(text document link)

  def index
    @type = params[:type] || TYPES.sample
    @entries = Entry.where("content @> 'type=>#{@type}'")
  end
end
