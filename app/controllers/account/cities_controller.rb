class Account::CitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @cities = current_user.cities
  end
end
