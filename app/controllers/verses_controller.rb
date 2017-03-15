class VersesController < ApplicationController
  def search
    query = {version_id: params[:version], book_id: params[:book], chapter: params[:chapter], verse: params[:verse]}
    result = Bible.search(query)

    render json: result.value.text
  end
end
