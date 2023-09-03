class FormController < ApplicationController
  

  def index
    response = RestClient.get 'https://opentdb.com/api_category.php'
  
    result = JSON.parse response

    result = result['trivia_categories']

    @categories = result.sort_by{|obj| obj['name']}
  end
end
