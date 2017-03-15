class VersesController < ApplicationController
  def search_verse
    # if multiple verses specified in url, separate into array to be used for multi-verse search
    if params[:verse].include? '-'
      params[:verse] = params[:verse].split('-')
    end

    # use parameters for biblesearch api verse search
    query = {version_id: params[:version], book_id: params[:book], chapter: params[:chapter], verse: params[:verse]}
    result = Bible.verse(query)

    render json: result
  end

  def search_chap
    # use parameters for biblesearch api chapter search
    query = {version_id: params[:version], book_id: params[:book], chapter: params[:chapter]}
    result = Bible.chap(query)

    render json: result
  end
end
