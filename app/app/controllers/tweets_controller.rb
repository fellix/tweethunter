class TweetsController < ApplicationController
  def index
    @hunters = Hunter.all    
  end

  def show
    @hunter = Hunter.find(params[:id])
  end

end
