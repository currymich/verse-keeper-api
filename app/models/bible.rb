class Bible < ApplicationRecord
  #https://github.com/americanbible/biblesearch-api-ruby for more info on api call syntax
  
  def self.verse(query)
    #params[:verse] is split into an array inside of verses_controller if passed in the url following the format '5-25', otherwise it is passed as a string
    if query[:verse].is_a? Array

      #syntax: verses("eng-ESV:2Tim.1","start","end")
      #return: array of verses
      result = @biblesearch.verses("#{query[:version_id]}:#{query[:book_id]}.#{query[:chapter]}","#{query[:verse][0]}", "#{query[:verse][1]}")

      # Check if search gave a valid result - bad result returns an empty array in this case - if so print just the bible text
      if result == []
        return "<h3 class=\"s1\">Search not found.</h3>\n"
      else
        merge = ""
        result.collection.each do |verse|
          merge += verse[:text]
        end
        return merge
      end

    else

      #syntax: verses("eng-ESV:2Tim.1:5")
      #return: single verse object or nil if bad
      result = @biblesearch.verse(query)

      if result == nil
        return "<h3 class=\"s1\">Search not found.</h3>\n"
      else
        return result.value.text
      end

    end

  end

  def self.chap(query)
    #syntax: verses("eng-ESV:2Tim.1")
    #return: single chapter object or nil if no result
    result = @biblesearch.chapter("#{query[:version_id]}:#{query[:book_id]}.#{query[:chapter]}")

    if result == nil
      return "<h3 class=\"s1\">Search not found.</h3>\n"
    else
      return result.value.text
    end
  end

  private
    @biblesearch = BibleSearch.new(ENV["BIBLESEARCH_API_KEY"])
end
