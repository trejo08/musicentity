module V1
  class PersonalityInsigth
    include ServiceConcern
    ENDPOINT = 'https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13'

    def initialize(username)
      @username = username
    end

    def call
      insigths
    end

    private
      def user_description
        V1::Tweets.call(@username)
      end

      def insigths
        puts user_description
        response = RestClient::Request.execute(
          method: :post, url: ENDPOINT,
          payload: { 'contentItems': [{ 'content': user_description, 'language': 'es' }] }.to_json,
          headers: { content_type: :json, accept: :json, authorization: "Bearer #{get_token}" }
        )
        JSON.parse(response)
      end

      def get_token
        payload = { grant_type: 'urn:ibm:params:oauth:grant-type:apikey', apikey: ENV['WATSON_API_KEY'] }
        response = RestClient::Request.execute(method: :post, url: 'https://iam.bluemix.net/identity/token',
          payload: payload,
          headers: { content_type: 'application/x-www-form-urlencoded', accept: :json }
        )
        JSON.parse(response.body)["access_token"]
      end
  end
end
