module V1
  class RecommendMusic
    include ServiceConcern

    def initialize(tag)
      @tag = tag
    end

    def call
      recommended_albums
    end

    private
      def recommended_albums
        response = RestClient.get("ws.audioscrobbler.com/2.0/?method=tag.gettopalbums&tag=#{@tag}&api_key=#{ENV['LASTFM_API']}&format=json&limit=5")
        JSON.parse(response)
      end
  end
end
