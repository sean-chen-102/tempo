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
  validates :completion_time, presence: true
  validates :link, presence: true

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
      # make sure each name begins with a capital letter
      interests_list.map! { |interest_name| interest_name.titleize }
      activities = Activity.joins(:interests).distinct.where(interests: {name: interests_list})
    end

    if not time.nil?
      activities = activities.where("completion_time <= ?", time)
    end

    # FOR YOUTUBE EMBEDS - TEMPORARY
    if activities.length > 0
      activities.each do |activity|
        type = activity.content_type
        if type == "video"
          link = activity.link

          if link.include? "watch?v="
            link = link.sub! "watch?v=", "v/"
          end

          activity.content = "<iframe width=\"345\" height=\"200\" src=\"#{link}\" frameborder=\"0\" allowfullscreen></iframe>"
          activity.save
        end
      end
    end

    activities = activities.as_json
    return activities
  end

  # Returns a list of all interests that the specified activity belongs to
  def self.get_interests(activity_id)
    return interests = Interest.joins(:activities).where(activities: {id: activity_id})\
  end

  # Associates an interest with this Activity
  def add_interest(interest_name)
    interest = Interest.find_by(name: interest_name)

    if not interest.nil?
      self.interests << interest
      self.save
    end
  end

  # Populates the database with new Activities based on news.
  def self.populate_database_with_news()
    potential_activities = GuardianScraper.get_articles_by_keyword

    potential_activities.each do |potential_activity|
      potential_activity.save_to_database
    end
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
    @interest_name = "News"

    def self.get_articles_by_keyword
      # Set up the parameters for a call to the Guardian API
      params = {}
      params["api-key"] = @api_key
      params["show-fields"] = "all"
      params["q"] = @interest_name

      # Make the JSON API call
      body = HTTParty.get(@base_url, query: params).body
      body = JSON.parse(body)
      body = body["response"]
      articles = body["results"]
      potential_activities = []

      # Create PotentialActivities out of all of the found articles
      articles.each do |article|
        unique_id = article["id"]
        title = article["webTitle"]
        content = article["fields"]["body"]
        content_type = "text"
        link = article["webUrl"]
        wordcount = article["fields"]["wordcount"]

        potential_activity = PotentialActivity.new(unique_id, title, content, content_type, link, wordcount, @interest_name)
        potential_activities.append(potential_activity)
      end

      return potential_activities
    end
  end

  # A Class that represents a potential new activity that will be added to the database
  class PotentialActivity

    def initialize(unique_id, title, content, content_type, link, wordcount, interest_name)
      @average_words_per_minute = 300
      @unqiue_id = unique_id
      @title = title
      @content = content
      @content_type = content_type
      @link = link
      @wordcount = wordcount.to_i
      @completion_time = self.calculate_estimated_time
      @interest_name = interest_name
    end

    def calculate_estimated_time
      estimate = (@wordcount / @average_words_per_minute.to_f).ceil # round up
      return estimate
    end

    def save_to_database
      if @wordcount >= @average_words_per_minute
        activity = Activity.new({ title: @title, content: @content, completion_time: @completion_time, content_type: @content_type, link: @link })
        if not activity.save
          puts "ERRORS populating database with new activities: #{activity.errors}"
        end

        activity.add_interest(@interest_name)
      end
    end
  end

end
