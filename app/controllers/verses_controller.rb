class VersesController < ApplicationController
  def search_verse
    if params[:verse].include? '-'
      params[:verse] = params[:verse].split('-')
    end

    query = {version_id: params[:version], book_id: params[:book], chapter: params[:chapter], verse: params[:verse]}
    result = Bible.verse(query)

    render json: result
  end

  def search_chap
    query = {version_id: params[:version], book_id: params[:book], chapter: params[:chapter]}
    result = Bible.chap(query)

    render json: result
  end
end
