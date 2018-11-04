module V1
  class Tweets
    include ServiceConcern

    def initialize username, limit = 60
      @username = username
      @limit = limit
    end

    def call
      get_tweets
    end

    private

    # Get tweets per user and convert to uniq string
    def get_tweets
      CLIENT.user_timeline(@username, count: @limit).map(&:full_text).to_sentence
    end

  end
end
