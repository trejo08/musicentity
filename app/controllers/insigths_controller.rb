class InsigthsController < ApplicationController
  protect_from_forgery except: :recommends
  helper_method :users
  respond_to :html, :js

  def recommends
    user = User.find(params[:id])
    @personality = V1::PersonalityInsigth.call(user.username)
    unless user.personality.present?
      user.personality = user_personality
      user.save
    end

    @recommends = V1::RecommendMusic.call(user.genres)
    render 'recommends.js'
  end

  def user_personality
    {}.tap do |personality|
      @personality['personality'].each do |trait, value|
        personality[trait['name']] = trait['percentile']
      end
    end
  end

  private
    def users
      @users ||= User.order(created_at: :asc)
    end
end
