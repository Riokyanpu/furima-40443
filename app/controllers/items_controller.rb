class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # indexアクションの処理
  end
end
