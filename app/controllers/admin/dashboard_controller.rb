class Admin::DashboardController < ApplicationController

# this should be cleaned up using a module

  http_basic_authenticate_with name: "Jungle", password: "book"

  def show
  end
end
