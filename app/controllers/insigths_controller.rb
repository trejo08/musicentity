class InsigthsController < ApplicationController
  helper_method :users
  respond_to :html, :js

  def index
  end

  def get_user_personality
    user = User.find(params[:id])

    @personality = V1::PersonalityInsigth.call(params[:user_name])

    unless user.personality.present?
      user.personality = update_personality
      user.save
    end

    @preferences = V1::RecommendMusic.call(user.tag)
  end

  def update_personality
    {}.tap do |personality|
      @my_personality['personality'].each do |trait, value|
        personality[trait['name']] = trait['percentile']
      end
    end
  end

  private
    def users
      @users ||= User.order(created_at: :asc)
    end

end
