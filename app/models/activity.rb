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
      activities = []
    else
      # make sure each name begins with a capital letter
      interests_list.map! { |interest_name| interest_name.titleize }
      activities = Activity.joins(:interests).distinct.where(interests: {name: interests_list})
    end

    if not time.nil? and not activities.empty?
      activities = activities.where("completion_time <= ?", time)
    end

    activities.each do |activity|
      formatted_activity = activity.get_advanced_info()
      activities_list.append(formatted_activity)
    end

    return activities_list.as_json
  end

  # Returns the advanced info of an Activity in JSON format.
  def get_advanced_info
    info = {}
    info = self.as_json
    interests = self.interests
    interests_list = []

    interests.each do |interest|
      interests_list.append(interest.name)
    end

    info["interests"] = interests_list
    return info.as_json
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
    puts "Synching data with The Guardian API, this may take a while..."
    potential_activities = GuardianScraper.get_articles_by_keyword

    potential_activities.each do |potential_activity|
      potential_activity.save_to_database
    end
    puts "Done!"
  end

  # Populates the database with new Activities based on news.
  def self.populate_database_with_videos()
    puts "Synching data with YouTube API, this may take a while..."
    interests = ["Technology", "Science", "Food", "Health", "History"]

    interests.each do |interest|
      potential_activities = YoutubeImporter.get_videos_by_keyword(interest)
      potential_activities.each do |potential_activity|
        potential_activity.save_to_database
      end
    end
    puts "Done!"
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
      params["page-size"] = 30
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

  # FOR SCRAPING EXTERNAL DATA FROM THE GUARDIAN
  class YoutubeImporter < Scraper
    
    @tech_channel_ids = [ "UCBJycsmduvYEL83R_U4JriQ", "UCDlQwv99CovKafGvxyaiNDA", "UCR0AnNR7sViH3TWMJl5jyxw", "UCgyqtNWZmIxTx3b6OxTSALw"]
    @science_channel_ids = ["UC6nSFpj9HTCZ5t-N3Rm3-HA", "UCHnyfMqiRRG1u-2MsSQLbXA", "UCZYTClx2T1of7BRZ86-8fow", "UCsXVk37bltHxD1rDPwtNM8Q", "UCUHW94eEFW7hkUMVaZz4eDg"]
    @food_channel_ids = ["UCaLfMkkHhSA_LaCta0BzyhQ", "UCIEv3lZ_tNXHzL3ox-_uUGQ", "UCfyehHM_eo4g5JUyWmms2LA"]
    @medicine_channel_ids = ["UCJayvjGvKEblkA3KYK1BQQw"]

    def self.get_videos_by_keyword(interest)
      ids = nil
      content_type = "video"
      potential_videos = []

      # Figure out which channelIds to use
      if (interest == "Technology")
        ids = @tech_channel_ids
      elsif (interest == "Science")
        ids = @science_channel_ids
      elsif (interest == "Food")
        ids = @food_channel_ids
      elsif (interest == "Health")
        ids = @medicine_channel_ids
      end
    
      if interest != "History"
        ids.each do |id|
          channel = Yt::Channel.new id: id
          videos = channel.videos

          videos.first(10).each do |video|
            unique_id = video.id
            title = video.title
            link = "https://www.youtube.com/embed/" + unique_id
            completion_time = (video.duration/60).ceil
            content = video.description

            potential_video = PotentialActivity.new(unique_id, title, content, content_type, link, completion_time, interest)
            potential_videos.append(potential_video)
          end
        end

      elsif interest == "History"
        playlist_id = "PLAC6B9F15C835224C"
        playlist = Yt::Playlist.new id: playlist_id

        playlist.playlist_items.first(30).each do |item|
          video = Yt::Video.new id: item.snippet.data["resourceId"]["videoId"]

          unique_id = video.id
          title = video.title
          link = "https://www.youtube.com/embed/" + unique_id
          completion_time = (video.duration/60).ceil
          content = video.description

          potential_video = PotentialActivity.new(unique_id, title, content, content_type, link, completion_time, interest)
          potential_videos.append(potential_video)
        end
      end

      return potential_videos
    end
  end

  # A Class that represents a potential new activity that will be added to the database
  class PotentialActivity

    def initialize(unique_id, title, content, content_type, link, wordcount, interest_name)
      @average_words_per_minute = 300
      @unique_id = unique_id
      @title = title
      @content = content
      @content_type = content_type
      @link = link

      if content_type == "text"
        @wordcount = wordcount.to_i
        @completion_time = self.calculate_estimated_time
      else
        @completion_time = wordcount # set the video completion_time
      end
      
      @interest_name = interest_name
    end

    def calculate_estimated_time
      estimate = (@wordcount / @average_words_per_minute.to_f).ceil # round up
      return estimate
    end

    def save_to_database
      if (@interest == "News" and @wordcount >= @average_words_per_minute) or (@interest != "News")
        if @title.include? " " # don't add titles that are too long without spaces
          activity = Activity.new({ title: @title, content: @content, completion_time: @completion_time, content_type: @content_type, link: @link })
          if not activity.save
            puts "ERRORS populating database with new activities: #{activity.errors.inspect}"
          else
            activity.add_interest(@interest_name)
          end
        end
      end
    end
  end

end
