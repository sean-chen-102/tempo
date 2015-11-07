require 'httparty'

# == Schema Information
#
# Table name: activities
#
#  id              :integer          not null, primary key
#  title           :string
#  content         :string
#  completion_time :integer
#  content_type    :string
#  link            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  like_count      :integer          default(0)
#  dislike_count   :integer          default(0)
#

class Activity < ActiveRecord::Base
	# Associations
	has_and_belongs_to_many :interests

	# Validations
	validates :title, presence: true
	validates :title, length: { maximum: 128 }
  validates :like_count, presence: true

	validates :completion_time, numericality: { greater_than: 0,
											    less_than_or_equal_to: 60 }

  # Returns a JSON list of all activities that match the Interests provided in interests_list, with
  # completion_time less than or equal to time.
  # If interests_list is nil, it returns a JSON list of all Activities in the database.
  def self.get_activities(interests_list, time)
    activities_list = []

    if interests_list.nil?
      activities = Activity.all
    else
      activities = Activity.joins(:interests).distinct.where(interests: {name: interests_list})
    end

    if not time.nil?
      activities = activities.where("completion_time <= ?", time)
    end

    activities = activities.as_json
    return activities
  end

  # Returns a list of all interests that the specified activity belongs to
  def self.get_interests(activity_id)
    return interests = Interest.joins(:activities).where(activities: {id: activity_id})\
  end

  # Populates the database with new Activities based on the given keyword, 
  # which should relate to an interest name.
  def self.populate_database(keyword)
    puts "In populate function"
    #guardian_scraper = GardianScraper.new
    #guardian_scraper.get_articles_by_keyword(keyword)
    GuardianScraper.get_articles_by_keyword(keyword)
  end

  # FOR SCRAPING EXTERNAL DATA
  class Scraper
  end

  # FOR SCRAPING EXTERNAL DATA FROM THE GUARDIAN
  class GuardianScraper < Scraper
    # Example API requests at:
    # http://explorer.content.guardianapis.com/search?api-key=2fpuqbm55pzzra87m9rvnkgc&show-fields=all&q=technology

    @api_key = "2fpuqbm55pzzra87m9rvnkgc"
    @base_url = "http://content.guardianapis.com/search"

    def self.get_articles_by_keyword(keyword)
      params = {}
      params["api-key"] = @api_key
      params["show-fields"] = "all"
      params["q"] = keyword

      body = HTTParty.get(@base_url, body: params).body
      body = JSON.parse(body)
      body = body["response"]
      articles = body["results"]
      
    end
  end

end
