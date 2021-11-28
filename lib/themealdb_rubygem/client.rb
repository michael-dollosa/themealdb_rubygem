require "faraday"
require "faraday_middleware"

module ThemealdbRubygem
  class Client
    BASE_URL = "https://www.themealdb.com/api/json/v1/1/"

    attr_reader :adapter, :api_key

    def initialize(api_key: nil, adapter: Faraday.default_adapter)
      @adapter = adapter
      @api_key = api_key
      @url = api_key.nil? ? BASE_URL : "https://www.themealdb.com/api/json/v2/#{api_key}/" 
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = @url
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
        conn.headers['Accept'] = 'application/json'
        conn.use Faraday::Response::RaiseError
      end
    end

    #endpoints
    def search_by_name(name)
      response = connection.get("search.php", {s: name})
      if response.body["meals"]
        { code: response.status, data: response.body }
      else
        { code: 404, data: 'No meals found' }
      end
    end

    def search_by_first_letter(letter)
      response = connection.get("search.php", {f: letter})
      if response.body["meals"]
        { code: response.status, data: response.body }
      else
        { code: 404, data: 'No meals found' }
      end
    end

    def search_by_id(id)
      response = connection.get("lookup.php", {i: id})
      if response.body["meals"]
        { code: response.status, data: response.body }
      else
        { code: 404, data: 'No meals found' }
      end
    end

    def random_meal
      response = connection.get("random.php")
      { code: response.status, data: response.body }
    end
    
    def list_categories_full
      response = connection.get("categories.php")
      { code: response.status, data: response.body }
    end

    def list_categories
      response = connection.get("list.php", {c: 'list'})
      { code: response.status, data: response.body }
    end

    def list_area
      response = connection.get("list.php", {a: 'list'})
      { code: response.status, data: response.body }
    end

    def list_ingredients
      response = connection.get("list.php", {i: 'list'})
      { code: response.status, data: response.body }
    end

    def filter_by_main_ingredient(ingredient)
      # clean up spaces in search string
      str = ingredient.gsub(/\s+,/, ',').gsub(/,\s+/, ',').strip
      response = connection.get("filter.php", {i: str})
      if response.body["meals"]
        { code: response.status, data: response.body }
      else
        { code: 404, data: 'No meals found' }
      end
    end

    def filter_by_category(category)
      #clean up spaces in search string
      str = category.gsub(/\s+,/, ',').gsub(/,\s+/, ',').strip
      response = connection.get("filter.php", {c: str})
      if response.body["meals"]
        { code: response.status, data: response.body }
      else
        { code: 404, data: 'No meals found' }
      end
    end

    def filter_by_area(area)
      #clean up spaces in search string
      str = area.gsub(/\s+,/, ',').gsub(/,\s+/, ',').strip
      response = connection.get("filter.php", {a: str})
      if response.body["meals"]
        { code: response.status, data: response.body }
      else
        { code: 404, data: 'No meals found' }
      end
    end
  end
end