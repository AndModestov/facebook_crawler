require 'rubygems'
require 'capybara'
require 'capybara/dsl'

Capybara.current_driver = :selenium
Capybara.app_host = 'https://www.facebook.com/'

class FacebookCrawler
  include Capybara::DSL

  def self.check_group(group_id)
    group = Group.find(group_id)
    login_data = { login: group.auth_login, pass: group.auth_password }
    session = Capybara::Session.new(:selenium)

    authenticate!(session, login_data)
  end

  private

  def self.authenticate!(session, login_data)
    session.visit('/')
    session.fill_in 'Email or Phone', with: login_data[:login]
    session.fill_in 'Password', with: login_data[:pass]
    session.click_button 'Log In'
  end

  def self.get_posts
  end

  def self.get_likes
  end

  def self.get_shares
  end
end