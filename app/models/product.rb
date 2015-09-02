class Product < ActiveRecord::Base
  scope :search_import, -> { includes(:searches) }

  searchkick text_start: ["name"], suggest: ["name"],  synonyms: [["large", "larry"], ["scallion", "green onion"], ["qtip", "cotton swab"]] 
  

  has_many :searches
  def search_data
    # as_json.merge conversions: conversions
    {
      name: name,
      conversions: searches.group("query").count
      # {"ice cream" => 234, "chocolate" => 67, "cream" => 2}
    }
  end
end
