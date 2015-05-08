class TweetsController < ApplicationController

#list all tweets
  def index
    @tweets = Tweet.all
  end

#list one tweet
  def show
    @tweet = Tweet.find_by_id(params[:id])

    if @tweet.nil?
      render :json => { message: "Error: Cannot find Tweet #{params[:id]}" }
    end
  end

#create one tweet

  def create
    @tweet = Tweet.new(post_params)

    if @tweet.save
      render :json => { message: "tweet saved!" }
    else
      render :json => { message: "tweet not saved:(" }
    end
  end

  private

  def post_params
    params.require(:tweet).permit(:author_name, :content)
  end

end
