require 'rubygems'
require 'capybara'
require 'capybara/dsl'

Capybara.current_driver = :selenium
Capybara.app_host = 'https://www.facebook.com/'

class FacebookCrawler
  include Capybara::DSL

  def self.check_group(group_id)
    group = Group.find(group_id)
    session = Capybara::Session.new(:selenium)

    authenticate!(session, group)
    get_posts!(session, group)

    session.destroy
  end

  private

  def self.authenticate!(session, group)
    session.visit('/')
    session.fill_in 'Email or Phone', with: group.auth_login
    session.fill_in 'Password', with: group.auth_password
    session.click_button 'Log In'
  end

  def self.get_posts!(session, group)
    session.visit(group.url)
    post_dates = session.all("abbr._5ptz")

    post_dates.each do |post_date|
      date = post_date[:title].to_datetime

      if date.between?(group.start_time, group.end_time)
        plink =  post_date.find(:xpath, '..')[:href]
        Post.create(group: group, link: plink, body: date)
      end
    end
  end

  def self.get_likes!
  end

  def self.get_shares!
  end
end
