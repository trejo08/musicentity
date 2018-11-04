module V1
  class Tweets
    include ServiceConcern

    def initialize(username, limit = 100)
      @username = username
      @limit = limit
    end

    def call
      get_tweets
    end

    private
      def get_tweets
        CLIENT.user_timeline(@username, count: @limit).map(&:full_text).to_sentence
      end
  end
end
