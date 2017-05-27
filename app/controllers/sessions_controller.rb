class SessionsController < ApplicationController
  before_filter :authenticate_user!
end
