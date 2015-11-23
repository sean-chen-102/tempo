require 'rails_helper'

# USAGE: bundle exec rspec

RSpec.describe "Guardian API scraper", :type => :request do
  # Verify the valid token
  it "succeeds at adding content to the database" do
    #news_activities = Activity.joins(:interests).distinct.where(interests: {name: 'News'})
    #number_of_news_activities = news_activities.size

    #Activity.populate_database_with_news()
    #news_activities_after_scrape = Activity.joins(:interests).distinct.where(interests: {name: 'News'})
    #number_of_news_activities_after_scrape = news_activities_after_scrape.size
    #expect(number_of_news_activities_after_scrape).to be > number_of_news_activities # we should have successfully gathered more news activities

    total_activities_before_scrape = Activity.all.size
    puts "Synching data with Guardian API, this may take a while..."
    Activity.populate_database_with_news()
    puts "Done."
    total_activities_after_scrape = Activity.all.size
    expect(total_activities_before_scrape).to be < total_activities_after_scrape
  end
end

RSpec.describe "YouTube API scraper", :type => :request do
  # Verify the valid token
  it "succeeds at adding content to the database" do
    #news_activities = Activity.joins(:interests).distinct.where(interests: {name: 'News'})
    #number_of_news_activities = news_activities.size

    #Activity.populate_database_with_news()
    #news_activities_after_scrape = Activity.joins(:interests).distinct.where(interests: {name: 'News'})
    #number_of_news_activities_after_scrape = news_activities_after_scrape.size
    #expect(number_of_news_activities_after_scrape).to be > number_of_news_activities # we should have successfully gathered more news activities

    total_activities_before_scrape = Activity.all.size
    puts "Synching data with YouTube API, this may take a while..."
    Activity.populate_database_with_videos()
    puts "Done."
    total_activities_after_scrape = Activity.all.size
    expect(total_activities_before_scrape).to be < total_activities_after_scrape
  end
end